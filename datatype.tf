variable "str" {
  type = string
  default = "hello world"
}

variable "map_name" {
  type = map
  default = {
    name = "hello"
    age = 30
  }
}

variable "number_name" {
  type = number
  default = 0
}

variable "list_name" {
  type = list
  default = ["Alice",1]
}

# 复合使用
variable "list_name" {
  type = list(string)
  default = ["Alice","Bob"]
}

