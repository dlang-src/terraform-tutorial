variable "aws_key_name" {
    description = "AWS key name"
    default = "hurley20141209"
}

variable "baseami" {
    description = "Hurley Base AMI per region"
    default = {
        oregon = "ami-41405a20"
        virginia = "ami-c1772cab"
    }
}


variable "hurley_infrastructure_amis" {
    description = "Hurley Dev AMI per region"
    default = {
        oregon = "ami-81b655e1"
        virginia = "ami-04b7806e"
    }
}

variable "vpc_map" {
    description = "Hurley VPCs"
    default = {
        oregon = "vpc-5d442e36"
        virginia = "vpc-51971a30"
    }
}

# Subnets http://wiki.hbo.com/display/HUR/Infrastructure+Overview
variable "nonprod_west_subnet_mapping" {
    description = "AWS subnets mapping in us-west-2 for nonprod"
    default = {
        "0" = "subnet-57442e3c"
        "1" = "subnet-215b314a"
        "2" = "subnet-cd5b31a6"
        "3" = "subnet-57442e3c"
        "4" = "subnet-215b314a"
        "5" = "subnet-cd5b31a6"
    }
}

variable "nonprod_east_subnet_mapping" {
    description = "AWS subnets mapping in us-west-2 for nonprod"
    default = {
        "0" = "subnet-b5af22d4"
        "1" = "subnet-b6ac21d7"
        "2" = "subnet-5a971a3b"
        "3" = "subnet-b5af22d4"
        "4" = "subnet-b6ac21d7"
        "5" = "subnet-5a971a3b"
    }
}

variable "prod_west_subnet_mapping" {
    description = "AWS subnets mapping in us-west-2 for prod"
    default = {
        "0" = "subnet-d57b72b7"
        "1" = "subnet-bfa981cb"
        "2" = "subnet-446f2502"
        "3" = "subnet-d57b72b7"
        "4" = "subnet-bfa981cb"
        "5" = "subnet-446f2502"
    }
}

variable "prod_east_subnet_mapping" {
    description = "AWS subnets mapping in us-west-2 for prod"
    default = {
        "0" = "subnet-a0186c88"
        "1" = "subnet-4295bd36"
        "2" = "subnet-62abe124"
        "3" = "subnet-a0186c88"
        "4" = "subnet-4295bd36"
        "5" = "subnet-62abe124"
    }
}

# Instance Types
variable "instance_types" {
    default = {
        development = "c3.large"
        integration = "c3.large"
        staging = "c3.large"
        snp = "c3.large"
        production = "c3.8xlarge"
        ops = "c4.xlarge"
    }
}
