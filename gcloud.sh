gcloud projects create lfkubernetescourse    
# Acessar https://console.cloud.google.com/billing/01658F-84156D-3805DB?project=<new-project-name> e fazer o vinculo com a billing account
gcloud init # Seleciona o projeto novo
gcloud compute networks create clusternet --subnet-mode=custom
gcloud compute firewall-rules create clusternetfw --network clusternet --allow tcp,icmp
gcloud compute networks subnets create clustersubnet --network clusternet --range=10.2.0.0/16
gcloud compute instances create main --zone=us-east4-c --machine-type=n2-standard-2 --image-project ubuntu-os-cloud --image-family=ubuntu-minimal-2004-lts --boot-disk-size=20GB --network=clusternet --subnet=clustersubnet 
gcloud compute instances create worker --zone=us-east4-c --machine-type=n2-standard-2 --image-project ubuntu-os-cloud --image-family=ubuntu-minimal-2004-lts --boot-disk-size=20GB --network=clusternet --subnet=clustersubnet 
# Esse comando faz o acesso SSH pra mim! (Antes ele seta a chave ssh como confiável) # https://stackoverflow.com/questions/27535945/how-to-get-the-ssh-keys-for-a-new-google-compute-engine-instance
gcloud compute ssh main --ssh-key-file=.ssh/id_rsa  
gcloud compute ssh worker --ssh-key-file=.ssh/id_rsa  
# E entrei! =) I'm in bitches!
