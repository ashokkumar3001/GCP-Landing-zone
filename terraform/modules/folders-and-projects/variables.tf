variable "organization" {
  type = string
  default = "714534223152"
}

variable "workload_folder" {
  type = string
  default = "workloads"
}

variable "network-folder" {
  type = string
  default = "network-test2"

}


variable "sub_folder" {
type = string
default = "development"
}

variable "dev_project_name" {
type = string
default = "test-develop"
}

variable "dev_project_id" {
  description = "Enter the workload project name which is a service project"
  type = string

}


variable "network_project_id" {
  description = "Enter the centralized project name which acts as a shared vpc project as well"
  type = string
}
