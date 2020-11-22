variable "ami_id" {
  default = ""
  description = "AMI ID to use"
  type = string
  # type = string | map | list
}

variable "instance_type" {
  default = ""
  description = "Instance size"
  type = string
}

variable "tags" {
  description = "Tags for the instance"
}

variable "sg_name"{

}

variable "ingress_rules"{

}

variable "bucket_name"{
    default = "my_bucket_name"
}

variable "acl"{
    default = "private"
}

variable "bucket_tags"{
    default = {
        CreateBy = "terraform"
    }
}
