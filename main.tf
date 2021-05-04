module "s3" {
  source          = "./s3"
  bucket_tag_name = var.bucket_tag_name
  s3_bucket_name  = var.s3_bucket_name
}


module "iam_role" {
  source                = "./iam"
  policy_attached_role  = var.policy_attached_role
  role_name             = var.role_name
  policy_name           = var.policy_name
  policy_description    = var.policy_description
  instance_profile_name = var.instance_profile_name
  s3_bucket_arn         = "${module.s3.s3_bucket_arn}"
}


module "vpc" {
  source                = "./vpc"
  vpc_cidr_block        = var.vpc_cidr_block
  vpc_name              = var.vpc_name
  igw_name              = var.igw_name
  subnets_cidr          = var.subnets_cidr
  azs                   = var.azs
  subnet_name           = var.subnet_name
  route_table_name      = var.route_table_name
}

module "private_key" {
  source                = "./privatekey"
  key_name              = var.key_name
  public_key            = var.public_key
}


module "instance" {
  source               = "./instance"
  public_instance_name = var.public_instance_name
  key_name             = "${module.private_key.key_pair_key_name}"
  sg_pub               = "${module.vpc.sg_public}"
  publicsubnet         = "${module.vpc.subnet_public}"
  iamm_profile          = "${module.iam_role.iam_profile}"
}

