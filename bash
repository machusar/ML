#git setup
git config --global user.name "machusar"
git config --global user.email "edomtarin@gmail.com"

#ssh key
ssh-keygen -t ed25519 -C "edomtarin@gmail.com"
cat ~/.ssh/id_ed25519.pub
