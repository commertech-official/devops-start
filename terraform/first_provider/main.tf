resource "docker_image" "nginx" {
  name  = var.containers.nginx.image
  keep_locally = true
}

resource "docker_image" "wordpress" {
  name  = var.containers.wordpress.image
  keep_locally = true
}