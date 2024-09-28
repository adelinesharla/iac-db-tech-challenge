# Variáveis para a infraestrutura geral (EKS, VPC, etc.)
variable "aws_region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "meu-cluster-eks"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

# Variáveis para o banco de dados Aurora
variable "db_password" {
  type      = string
  sensitive = true  # Marcar como sensível para que o Terraform a trate como um segredo
  description = "Senha do usuário mestre do banco de dados Aurora"
}