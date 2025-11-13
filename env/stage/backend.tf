terraform {
  backend "s3" {
    bucket         = "wave-app-terraform-state-147568755" 
    key            = "env/stage/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"                       
    encrypt        = true
  }
}
