#resource "helm_release" "alb_controller" {
#  name       = "aws-load-balancer-controller"
#  repository = "https://aws.github.io/eks-charts"
#  chart      = "aws-load-balancer-controller"
#  namespace  = "kube-system"
#
#  depends_on = [
#    module.eks.cluster_name
#  ]
#
#  set {
#    name  = "region"
#    value = var.aws_region
#  }
#
#  set {
#    name  = "vpcId"
#    value = module.vpc.vpc_id
#  }
#
#  set {
#    name  = "image.repository"
#    value = "602401143452.dkr.ecr.${var.aws_region}.amazonaws.com/amazon/aws-load-balancer-controller"
#  }
#
#  set {
#    name  = "serviceAccount.create"
#    value = "false"
#  }
#
#  set {
#    name  = "serviceAccount.name"
#    value = "aws-load-balancer-controller"
#  }
#
#  set {
#    name  = "clusterName"
#    value = module.eks.cluster_name
#  }
#}