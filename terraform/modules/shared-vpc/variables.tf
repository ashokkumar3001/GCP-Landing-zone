variable "host-project-id" {
  description = "The name of the Host project"
  type = string
  default = "shared-vpc-test-project"
}

variable "service-project-id-1" { 
  description = "The name of the Service project"
  type = string
  default = "service-test-project"
}

#variable "service-project-id-2" {
#type = string
#}
#


variable "workload-project-name" {

  description = "this is the service project"
  type = string

}

variable "network-project-name" {

  description = "This is the host project"
  type = string

}

