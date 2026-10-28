output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "vpc_id" {
  value = local.vpc_id
}

output "subnet_ids" {
  value = data.aws_subnets.default.ids
}

output "update_kubeconfig" {
  value = "aws eks update-kubeconfig --region ${var.region} --name ${module.eks.cluster_name}"
}

output "destroy_when_finished" {
  value = "Run terraform destroy from this directory when the demo is over. The control plane is billed while it exists."
}
