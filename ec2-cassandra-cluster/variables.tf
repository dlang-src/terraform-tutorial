variable "aws_key_name" {
    description = "AWS key name"
    default = "hbogotve"
}

variable "baseami" {
    description = "Base AMI per region"
    default = {
        oregon = ""
        virginia = ""
    }
}


variable "vpc_map" {
    description = " VPCs"
    default = {
        oregon = ""
        virginia = ""
    }
}

variable "nonprod_subnet_mapping" {
    description = "AWS subnets mapping in us-west-2 for nonprod"
    default = {
        "0" = ""
        "1" = ""
        "2" = ""
        "3" = ""
        "4" = ""
        "5" = ""
    }
}

# Instance Types
variable "instance_types" {
  description = "EC2 instance type"
  default = "t2.small"
}
