variable vpc_cidr_block {
    default = "10.0.0.0/16"
}
variable subnet_cidr_block {
    default = "10.0.0.0/24"
}
variable avail_zone {
    default = "ap-northeast-1a"
}
variable env_prefix {
    default = "dev"
}
variable my_ip {
    default = "111.249.209.226/32"  #NVM!  It's a dynamic IP
}
variable jenkins_ip {
    default = "35.77.91.48/32"  #NVM!  It's a dynamic IP
}
variable instance_type {
    default = "t2.micro"
}
variable region {
    default = "ap-northeast-1"
}