terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {
     host    = "npipe:////.//pipe//docker_engine"
}

# Create a container
resource "docker_container" "pythontf" {
  image = docker_image.python.latest
  name  = "pythontf"
}

resource "docker_image" "python" {
  name = "python:latest"
}


