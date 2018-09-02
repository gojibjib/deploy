output "jibjib_api_eip_public_ip" {
  value = "${aws_eip.jibjib_api.public_ip}"
}

output "jibjib_api_eip_private_ip" {
  value = "${aws_eip.jibjib_api.private_ip}"
}

output "jibjib_data_eip_public_ip" {
  value = "${aws_eip.jibjib_data.public_ip}"
}

output "jibjib_data_eip_private_ip" {
  value = "${aws_instance.jibjib_data.private_ip}"
}

output "jibjib_query_eip_public_ip" {
  value = "${aws_eip.jibjib_query.public_ip}"
}

output "jibjib_query_eip_private_ip" {
  value = "${aws_instance.jibjib_query.private_ip}"
}


