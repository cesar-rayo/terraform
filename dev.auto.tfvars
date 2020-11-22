ami_id = "ami-06fddf8d55d5ab5df"
instance_type = "t2.micro"
tags = {
    Name = "demo",
    Environment = "development"
}
sg_name = "dev-rules"
ingress_rules = [
    {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
    },
    {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
    }
]