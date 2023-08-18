variable "tags" {
  type    = list(string)
  default = ["web1", "web2", "app1", "app2", "db1", "db2"]
}
variable "cidrblock" {
  type    = string
  default = "10.10.0.0/16"

}
variable "dbsubnet_groups" {
  type    = list(string)
  default = ["db1", "db2"]

}
variable "subnetaz" {
  type    = list(string)
  default = ["eu-north-1a", "eu-north-1b", "eu-north-1a", "eu-north-1b", "eu-north-1a", "eu-north-1b"]

}
variable "aws_websg_configure" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type        = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = string

    }))
  })
  default = {
    name        = "websg"
    description = "this is web sg"
    rules = [{
      type        = "ingress"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"

      },
      {
        type        = "ingress"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = "0.0.0.0/0"

      },
      {
        type        = "egress"
        from_port   = 0
        to_port     = 65535
        protocol    = "tcp"
        cidr_blocks = "0.0.0.0/0"

      }
    ]

  }

}
variable "aws_appsg_configure" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type        = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = string

    }))
  })
  default = {
    name        = "appsg"
    description = "this is app sg"
    rules = [{
      type        = "ingress"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"

      },
      {
        type        = "ingress"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = "0.0.0.0/0"

      },
      {
        type        = "egress"
        from_port   = 0
        to_port     = 65535
        protocol    = "tcp"
        cidr_blocks = "0.0.0.0/0"

      }
    ]

  }

}
variable "aws_dbsg_configure" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type        = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = string

    }))
  })
  default = {
    name        = "dbsg"
    description = "this is db sg"
    rules = [{
      type        = "ingress"
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"

      },
      {
        type        = "egress"
        from_port   = 0
        to_port     = 65535
        protocol    = "tcp"
        cidr_blocks = "0.0.0.0/0"

      }
    ]

  }

}
