resource "aws_iam_instance_profile" "nextcloud" {
  name = "nextcloud_instance_profile"
  role = aws_iam_role.nextcloud.name

  tags = {
    Name = "nextcloud_instance_profile"
  }
}

resource "aws_iam_role" "nextcloud" {
  name  = "nextcloud_iam_role"
  assume_role_policy = data.aws_iam_policy_document.instance.json
}

data "aws_iam_policy_document" "instance" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_instance_profile" "db" {
  name = "db_instance_profile"
  role = aws_iam_role.db.name

  tags = {
    Name = "db_instance_profile"
  }
}

resource "aws_iam_role" "db" {
  name               = "db_iam_role"
  assume_role_policy = data.aws_iam_policy_document.instance.json

  tags = {
    Name = "db_iam_role"
  }
}

data "aws_iam_policy" "AmazonSSM" {
  name = "AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "nextcloud_ssm" {
  role       = aws_iam_role.nextcloud.name
  policy_arn = data.aws_iam_policy.AmazonSSM.arn
}

resource "aws_iam_role_policy_attachment" "db_ssm" {
  role       = aws_iam_role.db.name
  policy_arn = data.aws_iam_policy.AmazonSSM.arn
}

