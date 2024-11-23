terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "devops_demo" {
  name         = "devops-demo:latest"
  keep_locally = true
}

resource "docker_container" "devops_demo" {
  image = docker_image.devops_demo.image_id
  name  = "devops-demo-container"
  ports {
    internal = 8080
    external = 8080
  }
}
