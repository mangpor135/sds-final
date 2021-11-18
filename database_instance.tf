resource "aws_instance" "db" {
    ami = var.ami
    instance_type = "t2.micro"
    iam_instance_profile = aws_iam_instance_profile.db.name
    
    network_interface {
      network_interface_id = aws_network_interface.db_nat.id
      device_index = 0
    }

    network_interface {
      network_interface_id = aws_network_interface.db_private.id
      device_index = 1
    }

    # user_data = data.template_file.database_user_data.rendered

    tags = {
      "Name" = "database"
    }
}