# Remember to replace the address for your current /24 target.
1..254 | ForEach-Object { if (Test-Connection -Quiet -Count 1 -ComputerName "172.16.2.$_") { "172.16.2.$_ is up" } }
