resource "aws_instance" "demo-public" {
  ami                    = "ami-00999044593c895de"
  count                  = 1
  key_name               = "${var.key_name}"
  instance_type          = "t2.micro"
  iam_instance_profile   = "${var.iamm_profile}"
  vpc_security_group_ids = [var.sg_pub]
  subnet_id              = var.publicsubnet
  tags= {
    Name = var.public_instance_name
  }
}
