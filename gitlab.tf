resource "docker_container" "gitlab-ee" {
  name = "gitlab-ee"
  image = docker_image.gitlab-ee.latest
  ports {
    internal = 22
    external = 23
  }
  ports {
    internal = 443
    external = 444
  }
  ports {
    internal = 80
    external = 81
  }
}

resource "docker_image" "gitlab-ee"{
  name = "gitlab/gitlab-ee"
  keep_locally = true
}