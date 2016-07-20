provider "aws" {
    alias = "virginia"
    region = "us-east-1"
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
}

provider "aws" {
    alias = "oregon"
    region = "us-west-2"
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
}

variable "access_key" {}
variable "secret_key" {}
