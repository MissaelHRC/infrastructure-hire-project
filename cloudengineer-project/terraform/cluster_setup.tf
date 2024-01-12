###########
# Create a service account to be used with a Kubernetes resource
# ╷
# │ Error: Post "https://1FE103F0A48D3821D8FF895B980BF0B0.yl4.us-east-1.eks.amazonaws.com/api/v1/namespaces/missael/serviceaccounts": net/http: TLS handshake timeout
# │
# │   with kubernetes_service_account.missael_service_account_s3,
# │   on cluster_setup.tf line 4, in resource "kubernetes_service_account" "missael_service_account_s3":
# │    4: resource "kubernetes_service_account" "missael_service_account_s3" {
# │
# ╵
# ╷
# │ Error: Post "https://1FE103F0A48D3821D8FF895B980BF0B0.yl4.us-east-1.eks.amazonaws.com/api/v1/namespaces/kube-system/serviceaccounts": net/http: TLS handshake timeout
# │
# │   with kubernetes_service_account.alb_service_account,
# │   on cluster_setup.tf line 15, in resource "kubernetes_service_account" "alb_service_account":
# │   15: resource "kubernetes_service_account" "alb_service_account" {
# │
# ╵
###########
#resource "kubernetes_service_account" "missael_service_account_s3" {
#  metadata {
#    name      = local.k8s_service_account_name
#    namespace = local.k8s_service_account_namespace
#    annotations = {
#      "eks.amazonaws.com/role-arn" = module.iam_assumable_role_s3.iam_role_arn
#    }
#  }
#  automount_service_account_token = true
#}
#
#resource "kubernetes_service_account" "alb_service_account" {
#  metadata {
#    name      = "aws-load-balancer-controller"
#    namespace = "kube-system"
#    labels = {
#      "app.kubernetes.io/name"      = "aws-load-balancer-controller"
#      "app.kubernetes.io/component" = "controller"
#    }
#    annotations = {
#      "eks.amazonaws.com/role-arn"               = module.lb_role.iam_role_arn
#      "eks.amazonaws.com/sts-regional-endpoints" = "true"
#    }
#  }
#}