resource "aws_instance" "nextcloud" {
  ami           = var.ami
  instance_type = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.nextcloud.name

  network_interface {
    network_interface_id = aws_network_interface.nextcloud_public.id
    device_index         = 0
  }

  network_interface {
    network_interface_id = aws_network_interface.nextcloud_private.id
    device_index         = 1
  }

   tags = {
      "Name" = "nextCloud"
    }

    depends_on = [
    aws_instance.db
  ]

}