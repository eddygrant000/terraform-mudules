resource "aws_iam_role" "role" {
  name = var.role_name

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

resource "aws_iam_policy_attachment" "test-attach" {
  name       = var.policy_attached_role
  roles      = ["${aws_iam_role.role.name}"]
  policy_arn = "${aws_iam_policy.policy.arn}"
}
