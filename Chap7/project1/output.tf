output "instanceone_az" {
  value = aws_instance.exone.availability_zone
}

output "instancetwo_az" {
  value = aws_instance.extwo.availability_zone
}