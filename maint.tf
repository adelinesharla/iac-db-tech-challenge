# Configuração do provedor AWS (se não estiver em outro arquivo)
provider "aws" {
  region = var.aws_region 
}

# Definição do recurso do Aurora Serverless PostgreSQL
resource "aws_rds_cluster" "aurora_cluster" {
  cluster_identifier      = "meu-cluster-aurora" 
  engine                  = "aurora-postgresql"
  engine_mode             = "serverless"
  database_name           = "meu_banco"
  master_username         = "postgres"
  master_password         = var.db_password 
  vpc_security_group_ids  = [aws_security_group.default.id] 
  skip_final_snapshot     = true
  
  serverlessv2_scaling_configuration {
    min_capacity = 0.5 
    max_capacity = 4    
  }
}