module "aws-rds-alarms" {
  source                               = "lorenzoaiello/rds-alarms/aws"
  version                              = "2.1.0"
  db_instance_id                       = aws_db_instance.rds.id
  db_instance_class                    = var.instance_class
  disk_burst_balance_too_low_threshold = 50
}
