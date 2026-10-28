variable "region" {
  description = "AWS region. The default VPC in this region is the one the cluster uses."
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "EKS cluster name."
  type        = string
  default     = "capstone-shop"
}

variable "cluster_version" {
  description = "EKS Kubernetes version. Bump this if AWS refuses the default."
  type        = string
  default     = "1.32"
}

variable "vpc_id" {
  description = "Leave null to use the account default VPC."
  type        = string
  default     = null
}

variable "node_instance_type" {
  description = "Node size. t3.large has room for the shop plus Prometheus."
  type        = string
  default     = "t3.large"
}

variable "node_desired_size" {
  type    = number
  default = 2
}

variable "public_access_cidrs" {
  description = "Who can reach the Kubernetes API. Tighten this to your IP if you leave the cluster up."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
