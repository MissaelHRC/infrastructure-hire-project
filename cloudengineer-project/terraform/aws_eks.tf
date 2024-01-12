data "aws_eks_cluster" "cluster" {
  name = local.cluster_name

  depends_on = [module.eks.cluster_name]
}

data "aws_eks_cluster_auth" "cluster" {
  name = local.cluster_name

  depends_on = [module.eks.cluster_name]
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source                  = "terraform-aws-modules/vpc/aws"
  name                    = "missael-hire-project"
  cidr                    = "10.0.0.0/16"
  azs                     = data.aws_availability_zones.available.names
  public_subnets          = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  enable_dns_hostnames    = true
  map_public_ip_on_launch = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }
}

module "eks" {
  source                               = "terraform-aws-modules/eks/aws"
  cluster_version                      = 1.26
  cluster_name                         = local.cluster_name
  subnet_ids                           = module.vpc.public_subnets
  vpc_id                               = module.vpc.vpc_id
  enable_irsa                          = true
  cluster_endpoint_private_access      = true
  cluster_endpoint_public_access       = true
  cluster_endpoint_public_access_cidrs = ["187.189.33.230/32"]

  eks_managed_node_groups = {
    green = {
      min_size     = 1
      max_size     = 2
      desired_size = 1

      instance_types = ["t2.small"]
    }
  }

  tags = {
    environment = "missael"
    terraform   = "true"
  }
}

#resource "aws_eks_identity_provider_config" "aws_eks_oidc" {
#  cluster_name = module.eks.cluster_id
#
#  oidc {
#    client_id                     = "sts.amazonaws.com"
#    identity_provider_config_name = module.eks.cluster_id
#    issuer_url                    = module.eks.cluster_oidc_issuer_url
#  }
#}