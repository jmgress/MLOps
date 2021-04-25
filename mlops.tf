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

resource "docker_image" "python" {
  name = "python:latest"
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

resource "docker_container" "gitlab-ee" {
  name = "gitlab-ee"
  image = docker_image.gitlab-ee.latest
  command = ["tail", "-f" , "/dev/null"]
}

resource "docker_image" "gitlab-ee"{
  name = "gitlab/gitlab-ee"
  keep_locally = true
}


resource "docker_container" "sonarqube" {
  name = "sonarqube"
  image = docker_image.sonarqube.latest
  command = ["tail", "-f" , "/dev/null"]
}

resource "docker_image" "sonarqube"{
  name = "sonarqube"
  keep_locally = true
}

