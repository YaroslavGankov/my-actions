resource "null_resource" "command3" {
    provisioner "local-exec" {
        command = "docker images"
    }
}
