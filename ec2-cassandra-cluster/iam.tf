resource "aws_iam_role" "cassandra" {
  name = "rocket-cassandra"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "cassandra" {
  name = "rocket-cassandra"
  roles = ["${aws_iam_role.cassandra.name}"]
}

resource "aws_iam_role_policy" "cassandra" {
  name = "rocket-cassandra"
  role = "${aws_iam_role.cassandra.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:*"
      ],
      "Resource": [
        "arn:aws:s3:::*"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_role" "opscenter" {
  name = "rocket-opscenter"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "opscenter" {
  name = "rocket-opscenter"
  roles = ["${aws_iam_role.opscenter.name}"]
}

resource "aws_iam_role_policy" "opscenter" {
  name = "rocket-opscenter"
  role = "${aws_iam_role.opscenter.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:*"
      ],
      "Resource": [
        "arn:aws:s3:::*"
      ]
    }
  ]
}
EOF
}
