# Variáveis para a infraestrutura geral (EKS, VPC, etc.)
variable "aws_region" {
  default = "us-east-1"
}

# Variáveis para o banco de dados Aurora
variable "db_password" {
  type      = string
  sensitive = true  # Marcar como sensível para que o Terraform a trate como um segredo
  description = "Senha do usuário mestre do banco de dados Aurora"
}