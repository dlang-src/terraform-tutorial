resource "aws_instance" "production_west" {
    provider = "aws.oregon"
    count = "1"
    instance_type = "${var.instance_types}"
    ami = "${var.baseami.oregon}"
    iam_instance_profile = "${aws_iam_instance_profile.cassandra.name}"
    subnet_id = "${lookup(var.prod_west_subnet_mapping, count.index)}"
    vpc_security_group_ids = [
        "${aws_security_group.production_west.id}"
    ]
    associate_public_ip_address = false
    disable_api_termination = true
    monitoring = true
    key_name = "${var.aws_key_name}"
    root_block_device = {
        volume_size = 25
    }
    ephemeral_block_device = {
        device_name = "xvdb"
        virtual_name = "ephemeral0"
    }
    ephemeral_block_device = {
        device_name = "xvdc"
        virtual_name = "ephemeral1"
    }
    tags {
        Name = "tf-tutorial-dlang"
        environment = "testing"
        project = "none"
        role = "cassandra"
        service = "education"
        version = "1.0"
        dc = "us-west-2"
        rack = "${count.index}"
    }
}

resource "aws_security_group" "production_west" {
    provider = "aws.oregon"
    name = "rocket-cassandra-production"
    description = "rocket-cassandra-production"
    vpc_id = "${lookup(var.vpc_map, "oregon")}"
    tags {
        environment = "production"
        project = "hurley"
        role = "cassandra"
        service = "rocket"
    }
    ingress {
        self = true
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [
            "10.72.0.0/16"
        ]
    }
    ingress {
        self = true
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [
            "10.0.0.0/8"
        ]
    }
    ingress {
        self = true
        from_port = 9042
        to_port = 9042
        protocol = "tcp"
        cidr_blocks = [
            "10.0.0.0/8"
        ]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
