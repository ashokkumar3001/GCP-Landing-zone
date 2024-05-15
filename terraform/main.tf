

module "folders-and-projects" {
  source = ".//modules/folders-and-projects"
  dev_project_id = var.dev_project_id
  network_project_id = var.network_project_id

}



module "shared-vpc" {
  source = ".//modules/shared-vpc"
  workload-project-name = module.folders-and-projects.workload-project-name
  network-project-name = module.folders-and-projects.network-project-name
  
  depends_on = [module.folders-and-projects, module.gcp-required-apis]
}

module "centralized-logging" {
  source = ".//modules/centralized-logging"
  workload-project-name = module.folders-and-projects.workload-project-name
  network-project-name = module.folders-and-projects.network-project-name
# centralized-logging-bucket = var.centralized-logging-bucket
  depends_on = [module.folders-and-projects, module.gcp-required-apis]
}


module "vpc-network" { 
  source = ".//modules/vpc-network"
  workload-project-name = module.folders-and-projects.workload-project-name
  network-project-name = module.folders-and-projects.network-project-name
  shared-network-name =var.shared-network-name
  shared-subnet-name = var.shared-subnet-name
  service-network-name = var.service-network-name
  service-subnet-name = var.service-subnet-name
  depends_on = [module.folders-and-projects, module.gcp-required-apis]
}

module "firewall-rules" {
  source = ".//modules/firewall-rules"
  network-project-name = module.folders-and-projects.network-project-name
  shared-network-name = module.vpc-network.shared-network-name
#  shared-vpc-name = module.vpc-network.shared-vpc-name
  depends_on = [module.vpc-network]
}

module "vpc-peering" {
  source = ".//modules/vpc-peering"
  shared-vpc-name = module.vpc-network.shared-vpc-name
  service-vpc-name = module.vpc-network.service-vpc-name
  depends_on = [module.vpc-network]
}

module "cloud-nat-and-router" {
  source = ".//modules/cloud-nat-and-router"
  shared-network-name = module.vpc-network.shared-network-name
  network-project-name = module.folders-and-projects.network-project-name
  depends_on = [module.vpc-network]
}

## The below resources are created in the workloads project ##

module "gcp-required-apis"{
  source = ".//modules/gcp-required-apis"
  workload-project-name = module.folders-and-projects.workload-project-name
  network-project-name = module.folders-and-projects.network-project-name

}

module "secret-manager" {
  source = ".//modules/secret-manager"
  workload-project-name = module.folders-and-projects.workload-project-name
  depends_on = [module.gcp-required-apis]
}

module "compute-engine" {
  source = ".//modules/compute-engine"
  shared-vpc-name = module.vpc-network.shared-vpc-name
  shared-vpc-subnet = module.vpc-network.shared-vpc-subnet
# shared-network-name = module.vpc-network.shared-network-name
#  shared-subnet-name = module.vpc-network.shared-subnet-name
  workload-project-name = module.folders-and-projects.workload-project-name
  depends_on = [module.vpc-network, module.gcp-required-apis]
}

module "organization-policies" {
  source = ".//modules/organization-policies"

}
