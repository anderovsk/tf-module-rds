resource "aws_db_subnet_group" "default" {
  name       = "${var.name}-${var.env}-rds-subnetgroup"
  subnet_ids = var.rds_subnet_ids
  tags = {
    Name        = "${var.name}-${var.env}-rds-subnetgroup"
    Environment = var.env
  }
}

resource "aws_db_subnet_group" "private" {
  name       = "${var.name}-${var.env}-private-rds-subnetgroup"
  subnet_ids = var.rds_subnet_ids_private
  tags = {
    Name        = "${var.name}-${var.env}-rds-subnetgroup"
    Environment = var.env
  }
}
