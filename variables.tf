variable "placement" {
  description = "placement"
  default     = "PUB"
  type        = string
}

variable "project" {
  description = "project stream name"
  type        = string
  default     = "prashanthdemo"
}
variable "projectStream" {
  description = " 4 character project stream name/code "
  type        = string
  default     = "prashanthdemo"
}

variable "workStream" {
  description = " 4 character project stream name/code "
  type        = string
  default     = "prashanthdemo"
}


variable "sku" {
  description = "databricks SKU"
  type        = string
  default     = "standard"
}

variable "region" {
  type        = string
  description = "region. Choose from australia, europe, asia, europe"
  default     = "eastus"
}

variable "releaseVersion" {
  description = "releaseVersion"
  default     = "100"
  type        = string
}


variable "owner" {
  description = "owner"
  type        = string
  default     = "prashanth"
}

variable "environment" {
  description = "Environment. Upto 5 character. For e.g. dev, dev01 , prd01"
  type        = string
  default     = "dev"
}

variable "nameSuffix" {
  description = "Name suffix used for resources"
  type        = string
  default     = "pradem"
}

variable "existing_resource_group" {
  description = "existing resource group name"
  type        = string
  default     = ""
}

# Additional tags
variable "additional_tags" {
  description = "Additional set of tags"
  type        = map(string)
  default     = {}
}

# Admins users
variable "admins" {
  description = "List of Admin Users "
  type        = list
  default     = []
}

variable "clusterDriverSize" {
  description = "List of Admin Users "
  type        = string
  default     = "Standard_D3_v2"
}

variable "clusterName" {
  description = "List of Admin Users "
  type        = string
  default     = "prashanth.kumar@abc.com"
  
}

variable "clusterVersion" {
  description = "List of Admin Users "
  type        = string
  default     = "7.3.x-scala2.12"
}

variable "clusterWorkersQuantity" {
  description = "List of Admin Users "
  type        = string
  default     = "1"
}

variable "clusterWorkersSize" {
  description = "List of Admin Users "
  type        = string
  default     = "Standard_D3_v2"
}

variable "rgName" {
  description = "List of Admin Users "
  type        = string
  default     = "exam-app-pub-sbx"
}

variable "workspaceName" {
  description = "List of Admin Users "
  type        = string
  default     = "testdemoworkspace"
}
