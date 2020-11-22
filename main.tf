provider "aws" {
    region = "us-east-2"
}

resource "aws_security_group" "allow_ssh" {
    name = var.sg_name
    dynamic "ingress"{
        for_each = var.ingress_rules
        content {
            from_port   = ingress.value.from_port
            to_port     = ingress.value.to_port
            protocol    = ingress.value.protocol
            cidr_blocks = ingress.value.cidr_blocks
        }
    }
}

resource "aws_instance" "demo_instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  tags = var.tags
  security_groups = [ aws_security_group.allow_ssh.name ]
}

resource "aws_kms_key" "my_key" {
    description = "Key used to encrypt objects in bucket"
    deletion_window_in_days = 10 
}

resource "aws_s3_bucket" "any_bucket" {
    bucket = var.bucket_name
    acl = var.acl
    tags = var.bucket_tags

    server_side_encryption_configuration {
      rule {
        apply_server_side_encryption_by_default {
          kms_master_key_id = aws_kms_key.my_key.arn
          sse_algorithm = "aws:kms"
        }
      }
    }
}

output "my_key_arn" {
    value = aws_kms.my_key.arn  
}