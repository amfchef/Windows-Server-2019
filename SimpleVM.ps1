$VMname = "VM01"

New-VM -Name $VMname -MemoryStartupBytes 4096MB -SwitchName Private -NewVHDPath "C:\VMs\Virtual Hard Disks\$VMname.vhdx" -NewVHDSizeBytes 120GB
Add-VMDvdDrive -VMName $VMname -Path "E:\ISO\en_windows_server_2019_updated_april_2020_x64_dvd_12d6dc63.ISO"
Start-VM $VMname
vmconnect.exe localhost $VMname
