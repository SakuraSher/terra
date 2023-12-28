output "primary_address" {
  value = module.mysql_primary.address
}


output "secondary_address" {
  value = module.mysql_secondary.address
}

output "primary_port" {
  value = module.mysql_primary.port
}

output "secondary_port" {
  value = module.mysql_secondary.port
}
