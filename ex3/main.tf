# Création d'une ressource de paire de clés SSH
resource "openstack_compute_keypair_v2" "test_keypair" {
  provider   = openstack.ovh             # Nom du fournisseur déclaré dans provider.tf
  name       = "test_keypair"            # Nom de la clé SSH à utiliser pour la création
  public_key = file("~/.ssh/id_rsa.pub") # Chemin vers votre clé SSH précédemment générée
}

# Création d'une instance
resource "openstack_compute_instance_v2" "test_terraform_instance" {
  name        = "terraform_instance"    # Nom de l'instance
  provider    = openstack.ovh           # Nom du fournisseur
  image_name  = "Debian 10"             # Nom de l'image
  flavor_name = "d2-4"                  # Nom du type d'instance
  # Nom de la ressource openstack_compute_keypair_v2 nommée test_keypair
  key_pair    = openstack_compute_keypair_v2.test_keypair.name
  network {
    name      = "Ext-Net" # Ajoute le composant réseau pour atteindre votre instance
  }
  region = var.OS_REGION_NAME
}

# resource "openstack_networking_floatingip_v2" "fip_1" {
#   pool = "my_pool"
# }

# resource "openstack_compute_floatingip_associate_v2" "fip_1" {
#   floating_ip = openstack_networking_floatingip_v2.fip_1.address
#   instance_id = openstack_compute_instance_v2.instance_1.id
# }
# resource "ovh_cloud_project_failover_ip_attach" "myfailoverip" {
#   service_name = "XXXXXX"
#   ip           = "XXXXXX"
#   routed_to    = "XXXXXX"
# }

# Provision a web server (Nginx) on the instance using cloud-init
resource "openstack_compute_instance_v2_user_data" "test_terraform_instance_userdata" {
  instance_id = openstack_compute_instance_v2.test_terraform_instance.id

  user_data = <<-EOF
              #!/bin/bash
              apt update
              apt install -y nginx
              service nginx start
              EOF
}