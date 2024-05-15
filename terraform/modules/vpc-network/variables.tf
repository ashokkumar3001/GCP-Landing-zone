variable "shared-network-name" {
  description = "The name of the shared network being created"
  type        = string
}

variable "shared-subnet-name" {
  description = "The name of the shared sub-network being created"
  type        = string
}

variable "service-network-name" {
  description = "The name of the network being created"
  type        = string
}

variable "service-subnet-name" {
  description = "The name of the network being created"
  type        = string
#  default     = "service-project-test-subnet"
}


variable "workload-project-name" {

  description = "this is the service project"
  type = string

}

variable "network-project-name" {

  description = "This is the host project"
  type = string

}
