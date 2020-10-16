locals {
  criticality = {
    sbox       = "Low"
    dev        = "High"
    aat        = "High"
    staging    = "High"
    prod       = "High"
    preview    = "High"
    ithc       = "Medium"
    perftest   = "Medium"
    test       = "Medium"
    demo       = "Medium"
    ethosldata = "High"
  }

  env_display_names = {
    sbox       = "Sandbox"
    dev        = "Development"
    aat        = "Staging"
    staging    = "Staging"
    prod       = "Production"
    preview    = "Preview"
    ithc       = "ITHC"
    perftest   = "Test"
    demo       = "Demo"
    ethosldata = "EthosLDATA"
  }

  common_tags = {
    "managedBy"          = "Platform Engineering"
    "solutionOwner"      = "CFT"
    "activityName"       = "Private DNS"
    "dataClassification" = "Internal"
    "automation"         = ""
    "costCentre"         = "10245117" // until we get a better one, this is the generic cft contingency one
    "environment"        = local.env_display_names[var.env]
    "criticality"        = local.criticality[var.env]
  }
}
