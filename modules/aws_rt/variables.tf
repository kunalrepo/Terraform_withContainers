# variables for aws rt

variable "public_subnet_1_id" {
  type = string
  # as we don't have a subnet id
}

variable "public_subnet_2_id" {
  type = string
}

variable "private_subnet_1_id" {
  type = string
}

variable "private_subnet_2_id" {
  type = string
}

variable "vpc_id" {
  type = string
  #as of now we don't have the vpc id
}

variable "true" {
  type = bool
  default = true
}

variable "associate_with_private_ip" {
  type = string
  default = "10.0.0.5"
}

variable "destination_cidr_block" {
  type = string
  default = "0.0.0.0/0"
}