variable "shared-network-name" {
  description = "The name of the shared network being created"
  type        = string
  default     = ""
}

variable "shared-subnet-name" {
  description = "The name of the shared sub-network being created"
  type        = string
  default     = ""
}

variable "service-network-name" {
  description = "The name of the network being created"
  type        = string
  default     = ""
}

variable "service-subnet-name" {
  description = "The name of the network being created"
  type        = string
  default     = ""
}

#variable "shared-network" {
#  description = "Testing of the network"
#  type        = string
#}

variable "network-project-name" {

  description = "This is the host project"
  type = string

}


