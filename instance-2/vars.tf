variable AWS_ACCESS_KEY {}
variable AWS_SECRET_KEY {}

variable "AWS_REGION" {
	default = "ap-south-1"
}

variable "AMIS" {
	default = {
		ap-south-1 = "ami-0a7cf821b91bcccbc"
		ap-northeast-3 = "ami-0a6e8673186f56f71"
	}
}
variable PUB_KEY_PATH {
	default = "vpro-key.pub"
}

variable PRIV_KEY_PATH {
	default = "vpro-key"
}


variable USER {
        default = "ubuntu"
}


