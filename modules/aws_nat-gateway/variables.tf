variable "region" {
  type        = string
  default     = "ap-northeast-1"
  description = "Region of VPC"
}

variable "subnet_ids" {
  type        = string
  description = "ID of subnet that NAT Gateway will be created in"
  default     = "subnet-041510e8909031abd"
}