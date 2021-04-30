output "sg_public" {
  value = "${aws_security_group.sg_pub.id}"
}


output "subnet_public" {
  value = "${aws_subnet.publicsubnet.id}"
}

