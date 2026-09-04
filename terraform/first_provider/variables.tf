variable "string" {
    type = string
    default = "some string"
}

variable "list_of_strings" {
    type = list(string)
    default = ["a", "b", "c"]
}

variable "map" {
    type = map(string)
    default = {
        name = "John"
        surname = "Connor"
    }
}

variable "containers" {
    type = map(object ({
        name = string
        image = string
        ports = object ({
            external = number
            internal = number
        })
    }))
    default = {
        nginx = {
            name = "reverse-proxy-nginx"
            image = "nginx:1.21.1"
            ports = {
                internal = 80
                external = 1080
            }
        },
        wordpress = {
           name = "web-wordpress"
            image = "wordpress:latest"
            ports = {
                internal = 80
                external = 2080 
            }
        }
    }
}

variable "bool" {
    type = bool
    default = true
}