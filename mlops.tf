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

resource "docker_container" "sonarqube" {
  name = "sonarqube"
  image = docker_image.sonarqube.latest
  ports {
    internal = 9000
    external = 9001
  }
}

resource "docker_image" "sonarqube"{
  name = "sonarqube"
  keep_locally = true
}

resource "docker_container" "jenkins" {
  name = "jenkins"
  image = docker_image.jenkins.latest
  ports {
    internal = 8080
    external = 82
  }
}

resource "docker_image" "jenkins"{
  name = "jenkins/jenkins"
  keep_locally = true
}

