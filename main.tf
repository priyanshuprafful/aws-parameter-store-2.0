# resource "aws_ssm_parameter" "param" {
#
#   count = length(var.params)
#   name = var.params[count.index].name
#   type = var.params[count.index].type
#   value = var.params[count.index].value
# }
#
# variable "params" {
#   default = [
#     { name =  "demo1", value = "demo_value", type = "String" },
#     { name =  "demo2", value = "demo_value2", type = "String" },
#     { name =  "demo3", value = "demo_value3", type = "String" }
#
#   ]
# }
variable "params_map" {
  default = {
    demo1 = { value = "demo_value", type = "String" },
    demo2 = { value = "demo_value2", type = "String" },
    demo3 = { value = "demo_value3", type = "String" }
  }
}

resource "aws_ssm_parameter" "param" {
  for_each = var.params_map
  name  = each.key
  value = each.value.value
  type  = each.value.type
}
