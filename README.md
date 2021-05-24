# Infrastructure as Code using Terraform on Azure

<img src="https://secure.meetupstatic.com/photos/event/6/3/4/3/600_453385411.jpeg" width="200">

#### 05/27/2021

## Prerequisites

- [Terraform](http://terraform.io)
- Visual Studio Code
- HashiCorp Terraform VS Code Extension
- Azure Account


## 01 - Introduction

### Basic Workflow

- Credentials
- [Providers](https://registry.terraform.io)
- Workflow
    - Init
    - Plan
    - Apply
    - Destroy

### Interpolation

- References between resources

### Virtual Machine

- Create VM

## 02 - State

### Local State

- Create App Service
- File terraform.tfstate

### Remote State

- Save State in Azure Blob Storage

## 03 - Modules

### External Modules

- [Terraform Registry](https://registry.terraform.io)

### Local Modules

- Strorage Account Local Module


## 04 - Variables

- File terraform.tfvars
- Parameters -var in terraform apply 
- Environment variables TF_VAR_XXXX

## 05 - Summary

- Remote State, Modules, Variables
- Create 2 VM in availability set
- Network Security Group with RDP Port enabled