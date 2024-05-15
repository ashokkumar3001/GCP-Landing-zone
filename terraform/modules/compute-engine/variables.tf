variable "shared-vpc-name" {
  description = "shared network name"
  type        = string
}


variable "shared-vpc-subnet" {
  description = "this is the subnet for shared vpc"

}

#variable "dev-project" {
#  description = "this is the development project"
#  type = string
#}


#variable "shared-network-name" {
#  description = "The name of the shared network being created"
#  type        = string
#}

#variable "shared-subnet-name" {
#  description = "The name of the shared sub-network being created"
#  type        = string

#}


variable "workload-project-name" {

  description = "this is the service project"
  type = string

}
