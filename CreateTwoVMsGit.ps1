#Two machines full creation

#Resource group name
$ResourceGroup = DRtempResourceGroup
$Vnet = D-net
$Location = "EastUS" 

New-AzResourceGroup -Name $ResourceGroup  -Location $Location

#Subnet and Vnet
$Subnet= New-AzVirtualNetworkSubnetConfig -Name default -AddressPrefix 10.0.0.0/24
New-AzVirtualNetwork -Name $Vnet -ResourceGroupName $ResourceGroup -Location $Location -AddressPrefix 10.0.0.0/16 -Subnet $Subnet

 # Two Vnet
 #Create 2 VMs
$vm1 = New-AzVm `
 -ResourceGroupName $ResourceGroup `
 -Name vm1 `
 -VirtualNetworkName $Vnet `
 -SubnetName default `
 -image Win2016Datacenter `
 -Size Standard_B1S

 $vm2 = New-AzVm `
 -ResourceGroupName $ResourceGroup `
 -Name "vm2" `
 -VirtualNetworkName $Vnet `
 -SubnetName "default" `
 -image "Win2016Datacenter" `
 -Size "Standard_B1S"
