resource "aws_iam_policy" "policy" {
  name        = var.policy_name
  description = var.policy_description

 policy = <<EOT
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Effect":"Allow",
      "Action":[
        "s3:ListBucket",
        "s3:ListAllMyBuckets"
      ],
      "Resource":"arn:aws:s3:::*"
    },
    {
      "Effect":"Deny",
      "Action":[
        "s3:ListBucket"
      ],
      "NotResource":[
        "${var.s3_bucket_arn}"
      ]
    },
    {
      "Effect":"Allow",
      "Action":[
        "s3:ListBucket",
        "s3:GetObject"
      ],
      "Resource":[
        "${var.s3_bucket_arn}"
      ]
    }
  ]
}
EOT
}



resource "aws_iam_instance_profile" "iamm_profile" {
  name = var.instance_profile_name
  role = "${aws_iam_role.role.name}"
}
