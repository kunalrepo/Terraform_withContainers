# variables for aws vpc

variable "cidr_block"{
  type = string
  default = "10.0.0.0/16"
}

variable "true" {
  type = bool
  default = true
}

variable "vpc_tag" {
  type = map(any)
  default = {
    "Name" = "prod_vpc"
  }
}