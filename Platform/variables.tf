variable "tag"{
    description = "Tags for the project"
    default     = "Scrape"
}

variable "machine_name"{
    description = "the name of each VM to create"
    type        =  list(string)
    default     =   ["alpha", "beta", "gamma"]
}

variable "nic_name"{
    description = "NIC for each worker machine"
    type        =  list(string)
    default     = ["alpha", "beta", "gamma"]
}