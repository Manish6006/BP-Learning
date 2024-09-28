# If you are facing any issue while trigging the az login command then follow below few command to rectify the issue.

## First close your existing open az cli or powershell or cloudshell or git cli

### Run the command
`az login --use-device-code`

### the web link will be auto popped up into your browser 
### enter the `use-device-code` which render in your cli command prompt after ran the above command
### enter your user email id and password and complete the authenication process
### Once, you will be completed the authenication process then come back to az cli or powershell or cloudshell or git cli then you will be get below message after successful authenication 

`az login --use-device-code
To sign in, use a web browser to open the page https://microsoft.com/devicelogin and enter the code xxxxxxxxxxxxxxxxx to authenticate.

Retrieving tenants and subscriptions for the selection...

[Tenant and subscription selection]

No     Subscription name    Subscription ID                       Tenant
-----  -------------------  ------------------------------------  -----------------
[1] *  My First Azure           xxxxx-xxxx-xxxx-xxxx-xxxx  Default Directory

The default is marked with an *; the default tenant is 'Default Directory' and subscription is 'My First Azure' (xxx-xxx-xxxx-xxxx-xxxx).

Select a subscription and tenant (Type a number or Enter for no changes):

Tenant: Default Directory
Subscription: xxxxxxx-xxxx-xxxx-xxxxx

[Announcements]
With the new Azure CLI login experience, you can select the subscription you want to use more easily. Learn more about it and its configuration at https://go.microsoft.com/fwlink/?linkid=2271236

If you encounter any problem, please open an issue at https://aka.ms/azclibug

[Warning] The login output has been updated. Please be aware that it no longer displays the full list of available subscriptions by default.`

## Useful command while deploying the bicep template

`az deployment group create --resource-group <your-existing-resource-group-name> --template-file network-security-groups.bicep --parameters myNSGname='<enter-your-own-NSGname' location='<choose-your-region-to-deploy'`

### Convert bicep template into json file 
`az bicep build -f network-security-groups.bicep`

### If you face below types of issue while creating the subnet

{"code": "InvalidTemplate", "message": "Deployment template validation failed: 'The template resource 'zks-vnet-subnet-dev' for type 'Microsoft.Network/virtualNetworks/subnets' at line '21' and column '57' has incorrect segment lengths. A nested resource type must have identical number of segments as its resource name. A root resource type must have segment length one greater than its resource name. Please see https://aka.ms/arm-syntax-resources for usage details.'.", "additionalInfo": [{"type": "TemplateViolation", "info": {"lineNumber": 21, "linePosition": 57, "path": "properties.template.resources[0].type"}}]}

Then kindly remember that virtual network resource should act as parent for subnet resource.
