resource "aws_security_group" "sg_rds" {
  vpc_id = var.vpc_id


  ingress {
    description = "${var.name}-${var.env}-rds-secgroup"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = concat([var.vpc_cidr], var.rds_cidr_blocks_ingress)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.name}-${var.env}-rds-secgroup"
    Environment = var.env
  }
}
