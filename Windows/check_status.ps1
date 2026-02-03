Clear-Host
Write-Host "--- ESTADO DEL SISTEMA (WINDOWS) ---" 

# Nombre del equipo
$Hostname = $env:COMPUTERNAME
Write-Host "Nombre del equipo: $Hostname"

# IP Actual 
$IP = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.IPAddress -notlike "127*" -and $_.InterfaceAlias -like "*Ethernet 2*" }).IPAddress
Write-Host "IP Actual: $IP"

# Espacio en disco 
$Disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
$TotalGB = [Math]::Round($Disk.Size / 1GB, 2)
$FreeGB = [Math]::Round($Disk.FreeSpace / 1GB, 2)
$UsedGB = $TotalGB - $FreeGB

Write-Host "Espacio en disco :"
Write-Host "  Total: $TotalGB GB"
Write-Host "  Usado: $UsedGB GB"
Write-Host "  Libre: $FreeGB GB"