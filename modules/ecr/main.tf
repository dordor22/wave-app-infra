locals {
  frontend_name = "${var.project_name}-${var.env}-frontend"
  backend_name  = "${var.project_name}-${var.env}-backend"
}

resource "aws_ecr_repository" "frontend" {
  name = local.frontend_name

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  tags = {
    Project = var.project_name
    Env     = var.env
    App     = "frontend"
  }
}

resource "aws_ecr_repository" "backend" {
  name = local.backend_name

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  tags = {
    Project = var.project_name
    Env     = var.env
    App     = "backend"
  }
}
