variable "region" {
  type        = string
  default     = "ap-northeast-1"
  description = "Region of Security Group"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
  default     = "vpc-090e793b42ad6f18e"
}

### Must specify the exact ip address that has permission to access the EC2 instance in public subnet
variable "cidr_block" {
  description = "Public IP from Internet that has permission to access the EC2 instance in public subnet"
  type        = string
  default     = "0.0.0.0/0"
}