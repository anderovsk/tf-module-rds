#resource "aws_route53_record" "rds" {
#  zone_id = var.route53_zone_id
#  name    = "rds.${ var.route53_domain }"
#  type    = "CNAME"
#  ttl     = 60
#  records = [aws_db_instance.rds.address]
#}