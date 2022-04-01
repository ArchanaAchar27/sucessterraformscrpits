variable "vpcname"{
    type = string
    default = "practicegenerator"
}
variable "publiccidrs" {

    default= ["10.11.0.0/24","10.11.1.0/24","10.11.2.0/24"]
}
variable "azs"{
    default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "privatecidrs" {

    default= ["10.11.10.0/24","10.11.11.0/24","10.11.12.0/24"]
}
variable "s3_bucket_names" {
  type = list
  default = ["dev-bucket.app", "uat-bucket.app", "prod-bucket.app"]
}