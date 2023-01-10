vm1_name = "vm-1-a"
vm2_name = "vm-2-b"
vm3_name = "vm-3-c"

image_id = "fd82tb3u07rkdkfte3dn"

labels = {
  "project" = "slurm"
  "env"     = "lab"
}

cidr_blocks = [
  ["172.20.0.0/27"],
  ["172.21.0.0/27"],
  ["172.22.0.0/27"],
]

resources = {
  disk = 10
  cpu = 2
  memory = 4
}

listener = {
  name = "lab-listener"
  port = 80
}

healthcheck = {
  name = "lab-hc"
  port = 80
  path = "/"
}

#public_ssh_key_path = "yc-user:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCv8CkQIYACqoulg/cnpcR819eT78DSLk8HEVPXGmDB0LnD6Gl8Rfe3h53qG/peeJucE1UjRLWiBetFOLTsesz8/sh75pbOgXxA7CBO/Vnf5lfehLDnvyTQAaqBFGc29i97otYNtInzzFCITCeB0lWsxx8ciqdEauUrvci3++Cpv4EvLiB6+HbmyMCsR5jC8QIM3usoyXu5i4WQynrfzLSlivfuCFeVlm4nmGLA9WmzG+9wf8Ack+lj3O2Xy6wJLKHWcvlklHTWyeD1X6gREf33BjmGi8E/DA3LlyjLCd4whnwDNxCUYaJDGIUvIJQLdfP8fuQe+NIyVC0AS+vzUP0MNMHV5+Bfcp7FpgUCNYf1YUgZ26C8yHb+Oy0/WfcgfenJGEuHQnTAhH0jw9w7n4eBd7vh5GeXwKd81nEybHEBtaLCARH3IfdnCN1pS2phebOuwWyBHs7ODFxyDJZbUi7ZLD5uX+lMb9xDNihUhR9kXp7Y1EHdXhPESho4BfcO6Un08aPPKXZswmZdcNBY1gsHDvJXBqD6uOs84YOYY+RE+g+ovXYsdx0JUJhCqKA9yjFuYAUr6Z2nt7irO04psKZlt9aE73LG07WPlpQYtV++TIedIri67kneD9tUh53iO+ECkeECNNOUOoOg8TK7RGfCgvmGUFuBzlACt7OTYfUVvw== root@openvpn"
