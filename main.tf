resource "aws_ssm_parameter" "param" {

  count = length(var.params)
  name = var.params[count.index].name
  type = var.params[count.index].type
  value = var.params[count.index].value
}

variable "params" {
  default = [
    { name =  "demo1", value = "demo_value", type = "String" },
    { name =  "demo2", value = "demo_value2", type = "String" },
    { name =  "demo3", value = "demo_value3", type = "String" }

  ]
}