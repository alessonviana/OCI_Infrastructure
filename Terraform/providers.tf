terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "4.114.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.21.1"
    }
  }
}