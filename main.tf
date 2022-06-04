data "aws_secretsmanager_secret_version" "creds" {
  secret_id = "rds-creds"
}

locals {
  rds_db_creds = jsondecode(
    data.aws_secretsmanager_secret_version.creds.secret_string
  )
}

resource "aws_db_instance" "rds" {
  identifier              = "${var.name}-${var.env}"
  allocated_storage       = var.allocated_storage
  max_allocated_storage   = var.max_allocated_storage
  storage_type            = "gp2"
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  username                = "${var.name}${var.env}"
  password                = local.rds_db_creds.password
  parameter_group_name    = var.parameter_group_name
  db_subnet_group_name    = aws_db_subnet_group.private.name
  publicly_accessible     = true
  skip_final_snapshot     = true
  storage_encrypted       = var.storage_encrypted
  backup_retention_period = var.backup_retention_period
  backup_window           = var.backup_window
  maintenance_window      = var.maintenance_window
  vpc_security_group_ids  = [aws_security_group.sg_rds.id]
  depends_on              = [aws_db_subnet_group.private]
  performance_insights_enabled = var.performance_insights
  tags = {
    Name        = "${var.name}-${var.env}-rds"
    Environment = var.env
  }
  lifecycle {
    prevent_destroy = true
  }
}
