resource "aws_instance" "opscenter_production" {
    provider = "aws.virginia"
    count = "1"
    instance_type = "${var.ops_instance_type"
    ami = "${var.hurley_infrastructure_amis.virginia}"
    iam_instance_profile = "${aws_iam_instance_profile.opscenter.name}"
    subnet_id = "${lookup(var.prod_east_subnet_mapping, count.index)}"
    vpc_security_group_ids = [
        "sg-ad4593c8",
        "${aws_security_group.production_east.id}",
        "${aws_security_group.opscenter.id}"
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
        Name = "rocket-opscenter-production"
        environment = "production"
        project = "${var.service}"
        role = "opscenter"
        service = "${var.service}"
        version = "1.0"
    }
}

resource "aws_security_group" "opscenter" {
    provider = "aws.virginia"
    name = "rocket-opscenter"
    description = "rocket-opscenter"
    vpc_id = "${lookup(var.vpc_map, "virginia")}"
    tags {
        environment = "production"
        project = "hurley"
        role = "opscenter"
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
        from_port = 8888
        to_port = 8888
        protocol = "tcp"
        cidr_blocks = [
            "10.0.0.0/8"
        ]
    }
    ingress {
        self = true
        from_port = 61620
        to_port = 61620
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
