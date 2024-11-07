Announcing the Project Every Day Initiative - Today's project: 11/06/2024 AI Ops/DevOps Azure Demo coming by EOD PST!


az group create --name aidemo-remotestate-rg --location westus2

az storage account create \
    --name tfstatemlk231aidemo \
    --resource-group aidemo-remotestate-rg \
    --sku Standard_LRS \
    --encryption-services blob

az storage container create \
--name aidemo-portfolio-state \
--account-name tfstatemlk231aidemo

git add .
git commit -m "Add initial Terraform configuration"
git push origin main