provider "aws" {
  region = var.aws_region 
}

resource "aws_rds_cluster" "meu_banco_de_dados" {
  cluster_identifier      = "meu-cluster-aurora" 
  engine                  = "aurora-postgresql"
  engine_mode             = "serverless"
  database_name           = "tech_challenge_dev"
  master_username         = "postgres"
  master_password         = var.db_password 
  vpc_security_group_ids  = [var.vpc_id]
  skip_final_snapshot     = true
}