variable "project_name" {
  description = "Project name"
  type        = string
}

variable "env" {
  description = "Environment name"
  type        = string
}

variable "noncurrent_version_expiration_days" {
  description = "Days to keep non-current versions"
  type        = number
  default     = 365
}
