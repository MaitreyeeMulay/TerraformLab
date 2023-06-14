variable "rgname" {
    type = string
    default = "rg111" # we can give value here or in terraform.tfvars file
    description = "rg name" #like comment not cpmplusory
  
}

variable "location" {
    type = string
    default = "west us 3"
    description = "rg location we are providing"
  
}

/* Data types-
1. string - characters under double quotes
2. boolean - true/false
3.number -*/