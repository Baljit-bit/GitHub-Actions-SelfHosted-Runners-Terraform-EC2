variable "aws_access_key_id" {}
variable "aws_secret_access_key" {}

variable "instance_type" {
  description = "EC2 Instances Type based on your Server Requirement"
  type        = string
  default     = "t3.micro"
}

variable "region" {
  description = "EC2 AWS region"
  type        = string
  default     = "ca-central-1"
}

variable "subnet_id" {
  description = "Enter your VPC Subnet1 ID"
  type        = string
  default     = "subnet-0c5ec87a473a3438d"
}

variable "amiID" {
  description = "EC2 AMI ID"
  type        = string
  default     = "ami-0eb9fdcf0d07bd5ef"
}

variable "key_name" {
  description = "EC2 Instances jenkins key"
  type        = string
  default     = "jenkins"
}