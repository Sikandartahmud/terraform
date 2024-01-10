resource "aws_key_pair" "vprofilekey" {
	key_name = "vprofile-1"
	public_key = file(var.PUB_KEY_PATH)
}

resource "aws_instance" "my_inst" {
	ami = lookup(var.AMIS, var.AWS_REGION)
	instance_type = "t2.micro"
	key_name = aws_key_pair.vprofilekey.key_name
	tags = {
		Name = "First-terra-launch"
		project = "Training"
	}
	
	provisioner "file" {
		source = "web.sh"
		destination = "/tmp/web.sh"
	}

	provisioner "remote-exec" {
		inline = [
			"chmod +x /tmp/web.sh" ,
			"sudo /tmp/web.sh"
			]
	}
	
	connection  {
		user = var.USER
		private_key = file(var.PRIV_KEY_PATH)
		host = self.public_ip
	}
}


