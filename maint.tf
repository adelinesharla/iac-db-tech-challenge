# Configuração do provedor AWS 
provider "aws" {
  region = var.aws_region 
}

# Criação de um grupo de segurança (opcional, se necessário)
resource "aws_security_group" "aurora_sg" {
  name        = "aurora-security-group"
  description = "Grupo de segurança para o cluster Aurora Serverless PostgreSQL"
  vpc_id      = # ID da sua VPC (obtenha de outro lugar ou crie aqui se necessário)

  # Adicione regras de entrada conforme necessário (por exemplo, para permitir acesso a partir do EKS)
  ingress {
    from_port   = 5432  # Porta padrão do PostgreSQL
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Ajuste conforme necessário
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Definição do recurso do Aurora Serverless PostgreSQL
resource "aws_rds_cluster" "meu_banco_de_dados" {
  cluster_identifier      = "meu-cluster-aurora" 
  engine                  = "aurora-postgresql"
  engine_mode             = "serverless"
  database_name           = "meu_banco"
  master_username         = "postgres"
  master_password         = var.db_password 
  vpc_security_group_ids  = [aws_security_group.aurora_sg.id]  # Use o grupo de segurança criado acima
  skip_final_snapshot     = true
  
  serverlessv2_scaling_configuration {
    min_capacity = 0.5 
    max_capacity = 1    
  }
}