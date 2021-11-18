resource "aws_network_interface" "db_private" {
    subnet_id = aws_subnet.nextcloud_private_subnet.id
    # security_groups = [ aws_security_group.private_instance.id ]
    private_ips = [var.db_private_ip]
}

resource "aws_network_interface" "db_nat" {
    subnet_id = aws_subnet.db_private_subnet.id
    # security_groups = [aws_security_group.private_database.id]
}