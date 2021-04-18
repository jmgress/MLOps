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
  command = ["tail", "-f" , "/dev/null"]
}

resource "docker_container" "tensorflow" {
  name = "tensorflow"
  image = docker_image.tensorflow.latest
  command = ["tail", "-f" , "/dev/null"]
}

resource "docker_image" "tensorflow"{
  name = "tensorflow/tensorflow"
  keep_locally = true
}

resource "docker_image" "python" {
  name = "python:latest"
}



