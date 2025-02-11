terraform {
  backend "remote" {
    organization = "Vishal-POCterraform"

    workspaces {
      name = "DemoTerraform"
    }
  }
}

resource "null_resource" "example" {
  triggers = {
    value = "An example resource that does nothing!"
  }
}

