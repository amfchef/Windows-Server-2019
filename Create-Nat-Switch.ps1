
New-VMSwitch -SwitchName “WAN” -SwitchType Internal
New-NetIPAddress -IPAddress 10.10.10.1 -PrefixLength 24 -InterfaceAlias “vEthernet (WAN)”
New-NetNAT -Name “WAN” -InternalIPInterfaceAddressPrefix 10.10.10.0/24
Set-NetFirewallRule -DisplayName "File and Printer Sharing (Echo Request - ICMPv4-In)" -enabled True