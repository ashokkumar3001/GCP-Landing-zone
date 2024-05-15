#variable "shared-network-name" {
#  description = "The name of the shared network being created"
#  type        = string
#}

#variable "shared-subnet-name" {
#  description = "The name of the shared sub-network being created"
#  type        = string
#}

#variable "service-network-name" {
#  description = "The name of the network being created"
#  type        = string
#}

#variable "service-subnet-name" {
#  description = "The name of the network being created"
#  type        = string
#}

#variable "shared-network" {
#  description = "The name of the network being created"
#  type        = string
#  default     = "projects/shared-vpc-project-415009/global/networks/test-shared"
#}

#variable "shared-network" {
#  description = "Testing of the network"
#  type        = string
#}


variable "dev_project_id" {
  description = "Enter the workload project name which is a service project"
  type = string
}


variable "network_project_id" {
  description = "Enter the centralized project name which acts as a shared vpc project as well"
  type = string
}


variable "shared-network-name" {
  description = "The name of the shared network being created"
  type        = string
#  default     = "shared-vpc-test"
}

variable "shared-subnet-name" {
  description = "The name of the shared sub-network being created"
  type        = string
#  default     = "shared-vpc-test-subnet"
}

variable "service-network-name" {
  description = "The name of the network being created"
  type        = string
#  default     = "service-project-test"
}

variable "service-subnet-name" {
  description = "The name of the network being created"
  type        = string
#  default     = "service-project-test-subnet"
}

#variable "centralized-logging-bucket" {

#  description = "Enter the centralized bucket name to store the logs"
#  type = string

#}
