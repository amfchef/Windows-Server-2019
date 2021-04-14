$VMname = "EC-ContainerHOST01"

New-VHD -Path "C:\VMs\Virtual-Hard-Disks\$($VMname).vhdx" -ParentPath C:\VMs\ref\ref.vhdx

New-VM -Name $VmName -MemoryStartupBytes 4096MB -SwitchName Internal -VHDPath "C:\VMs\Virtual Hard Disks\$VmName.vhdx" -Generation 2
Set-VM $VmName -ProcessorCount 2
Set-VM -Name $VmName -AutomaticCheckpointsEnabled $false
Start-VM $VmName
vmconnect.exe localhost $VmName

$VMname = "EC-CONHOST01"
$VM = @{
     Name = $VMName
     MemoryStartupBytes = 4096MB
     Generation = 2
     NewVHDPath = "C:\VMs\Virtual-Hard Disks\$($VMname).vhdx"
     parentPath = "C:\Virtual-Machines\$VMName"
     SwitchName Internal
 }

New-VM @VM
Start-VM $VmName

docker pull mcr.microsoft.com/windows/servercore:ltsc2019

docker pull mcr.microsoft.com/windows/nanoserver:1809