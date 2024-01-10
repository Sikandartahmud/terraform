resource "aws_instance" "my_inst" {
	ami = lookup(var.AMIS, var.AWS_REGION)
	instance_type = "t2.micro"
	tags = {
		name = "first-terra-launch"
	}
}

