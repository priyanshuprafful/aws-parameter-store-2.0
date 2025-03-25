resource "aws_ssm_parameter" "parameters_store" {
  count = length(var.parameters)
  name = var.parameters[count.index].name
  type = var.parameters[count.index].type
  value = var.parameters[count.index].value

}

variable "parameters" {
  default = [
    {name = "demo1", value = "demo1" , type = "String"},
    {name = "demo2", value = "demo2" , type = "String"},
    {name = "demo3", value = "demo3" , type = "String"},
    {name = "demo4", value = "demo4" , type = "String"},
  ]
}

