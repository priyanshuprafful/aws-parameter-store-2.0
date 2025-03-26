resource "aws_ssm_parameter" "parameters_store" {
  count = length(var.parameters)
  name = var.parameters[count.index].name
  type = var.parameters[count.index].type
  value = var.parameters[count.index].value
 # overwrite = true

}

variable "parameters" {
  default = [
    {name = "roboshop.dev.frontend.catalogue_url", value = "http://catalogue-dev.saraldevops.site" , type = "String"},
    {name = "roboshop.dev.frontend.user_url", value = "http://user-dev.saraldevops.site" , type = "String"},
    {name = "roboshop.dev.frontend.cart_url", value = "http://cart-dev.saraldevops.site" , type = "String"},
    {name = "roboshop.dev.frontend.payment_url", value = "http://payment-dev.saraldevops.site" , type = "String"},
    {name = "roboshop.dev.frontend.shipping_url", value = "http://shipping-dev.saraldevops.site" , type = "String"},

  ]
}

