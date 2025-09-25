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
    "roboshop.dev.frontend.shipping_url" = { value = "http://shipping-dev.devopspro.fun:8080/", type = "String" } ,

    "roboshop.dev.cart.redis_host" = { value = "redis-dev.devopspro.fun", type = "String" } ,

    "roboshop.dev.cart.catalogue_host" = { value = "catalogue-dev.devopspro.fun", type = "String" } ,

    "roboshop.dev.cart.catalogue_port" = { value = "8080", type = "String" } ,

    "roboshop.dev.catalogue.mongo" = { value = "true", type = "String" } ,

    "roboshop.dev.cart.mongo_url" = { value = "mongodb://mongodb-dev.devopspro.fun:27017/catalogue", type = "String" } ,



    "roboshop.dev.payment.cart_host" = { value = "cart-dev.devopspro.fun", type = "String" } ,

    "roboshop.dev.payment.cart_port" = { value = "8080", type = "String" } ,

    "roboshop.dev.payment.user_host" = { value = "user-dev.devopspro.fun", type = "String" } ,

    "roboshop.dev.payment.user_port" = { value = "8080", type = "String" } ,

    "roboshop.dev.payment.amqp_host" = { value = "rabbitmq-dev.devopspro.fun", type = "String" } ,

    "roboshop.dev.payment.amqp_user" = { value = "roboshop", type = "String" } ,

    "roboshop.dev.shipping.cart_endpoint" = { value = "cart-dev.devopspro.fun:8080", type = "String" } ,

    "roboshop.dev.shipping.db_host" = { value = "mysql-dev.devopspro.fun", type = "String" } ,



    "roboshop.dev.user.mongo" = { value = "true", type = "String" } ,

    "roboshop.dev.user.redis_host" = { value = "redis-dev.devopspro.fun", type = "String" } ,

    "roboshop.dev.user.mongo_url" = { value = "mongodb://mongodb-dev.devopspro.fun:27017/users", type = "String" } ,









    #passwords will never part of git repos , usually in orgs we create them manually , meaning whom ever have access they  will provision these secrets in parameter store
    "roboshop.dev.payment.amqp_pass" = { value = "roboshop123", type = "SecureString" } ,



  }
}

resource "aws_ssm_parameter" "param" {
  for_each = var.params_map
  name  = each.key
  value = each.value.value
  type  = each.value.type
}
