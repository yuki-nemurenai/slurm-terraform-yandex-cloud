resource "tls_private_key" "rsa_key" {
  algorithm   = "RSA"
  rsa_bits = 4096
}
