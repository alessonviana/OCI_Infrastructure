install:
	ansible-galaxy install -r microk8s-ansible/roles/requirements.yml

cluster_mini: oci terraform ansible_micro

cluster_k3s: oci terraform ansible_k3s

oci:
	if [ -d "/Users/${USER}/.oci" ]; then rm -rf "/Users/${USER}/.oci"; fi
	echo "43" | oci session authenticate

terraform:
	terraform -chdir=k3s-terraform/ init
	echo "yes" | terraform -chdir=k3s-terraform/ apply --auto-approve

ansible_k3s:
	ansible-playbook -i k3s-ansible/inventory/sample/hosts.ini k3s-ansible/site.yml --key-file "k3s-terraform/id_rsa"

ansible_micro:
	ansible-playbook -i k3s-ansible/inventory/sample/k3s-ansible/site.yml --key-file "k3s-terraform/id_rsa"

terraform_destroy:
	echo "yes" | terraform -chdir=k3s-terraform/ destroy --auto-approve