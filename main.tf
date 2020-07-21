provider "aws" {
  version = "~> 2.0"
  region  = "${var.aws_region}"
access_key = ""
secret_key = ""
}

resource "aws_vpc" "vpc2" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "${var.vpc_name}"
  }
}

data "aws_vpc" "selected" {
  id = "${aws_vpc.vpc2.id}"
}

resource "aws_subnet" "example" {
  vpc_id            = "${data.aws_vpc.selected.id}"
  availability_zone = "${var.availability_zone}"
  cidr_block        = "${var.subnet_cidr}"

 tags = {
    Name = "${var.subnet_name}"
  }
}
