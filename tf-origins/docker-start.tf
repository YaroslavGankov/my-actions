#file for test github action from cache-test.yml

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "null_resource" "command1" {
    provisioner "local-exec" {
        command = "docker ps"
    }
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}

resource "null_resource" "command2" {
    provisioner "local-exec" {
        command = "echo Ololo $(date)"
    }
}

module "external" {
  source="module1"
}
