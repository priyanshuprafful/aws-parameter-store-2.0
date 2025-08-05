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
    "roboshop.dev.frontend.catalogue_url" = { value = "http://catalogue-dev.devopspro.fun:8080/", type = "String" },
    "roboshop.dev.frontend.user_url" = { value = "http://user-dev.devopspro.fun:8080/", type = "String" },
    "roboshop.dev.frontend.cart_url" = { value = "http://cart-dev.devopspro.fun:8080/", type = "String" },
    "roboshop.dev.frontend.payment_url" = { value = "http://payment-dev.devopspro.fun:8080/", type = "String" },
    "roboshop.dev.frontend.shipping_url" = { value = "http://shipping-dev.devopspro.fun:8080/", type = "String" },



  }
}

resource "aws_ssm_parameter" "param" {
  for_each = var.params_map
  name  = each.key
  value = each.value.value
  type  = each.value.type
}
