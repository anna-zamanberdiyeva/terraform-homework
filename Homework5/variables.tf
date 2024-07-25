variable region {
    type = string
}

variable vpc_cidr {
     type = list(object( {
        vpc = string
    }))
}

variable map_public_ip_on_launch {
    type = bool
}

variable port {
    type = list
}

variable subnet {
    type = list(object( {
        cidr = string
        az = string
        name = string
        rt_name = string
    }))
}

variable internet_gateway_name {
    type = string
}

variable ec2_type {
    type = list(object( {
        instance_type = string
        name = string
    }))
}

variable dns_support {
    type = list(object( {
        dns = string
    }))
}


variable dns_hostnames {
     type = list(object( {
        hostname = string
    }))
}