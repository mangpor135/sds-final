resource "aws_network_interface" "nextcloud_public" {
    subnet_id = aws_subnet.nextcloud_public_subnet.id
    # security_groups = [ aws_security_group.public_sg_group.id ]
}

resource "aws_network_interface" "nextcloud_private" {
    subnet_id = aws_subnet.nextcloud_private_subnet.id
    # security_groups = [ aws_security_group.private_instance.id ]
    private_ips = [var.nextcloud_private_ip]
}