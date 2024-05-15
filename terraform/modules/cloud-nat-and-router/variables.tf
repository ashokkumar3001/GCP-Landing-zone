
#variable "shared-vpc-name" {
#  description = "shared network name"
#  type        = string
#}

#variable "service-vpc-name" {
#  description = "service network name"
#  type        = string

#}

#variable "workload-project-name" {

#  description = "this is the service project"
#  type = string

#}

variable "network-project-name" {

  description = "This is the host project"
  type = string

}


variable "shared-network-name" {
  description = "The name of the shared network being created"
  type        = string
}
