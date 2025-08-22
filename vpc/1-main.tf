resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name= "${var.cluster_name}-vpc"
    "kubernetes.io/cluster/${var.cluster_name}"         =   "shared"
  }
}
