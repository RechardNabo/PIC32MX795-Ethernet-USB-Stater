$ErrorActionPreference = 'Stop'
$id = 'USB\VID_04D8&PID_000A\000100000001'
Write-Host "Disabling device $id"
Disable-PnpDevice -InstanceId $id -Confirm:$false
Start-Sleep -Seconds 2
Write-Host "Enabling device $id"
Enable-PnpDevice -InstanceId $id -Confirm:$false
Start-Sleep -Seconds 2
Write-Host "Checking DOS device symlink..."
$k = Add-Type -Name K -MemberDefinition '[DllImport("kernel32")] public static extern int QueryDosDevice(string lpDeviceName, System.Text.StringBuilder lpTargetPath, int ucchMax); [DllImport("kernel32")] public static extern int GetLastError();' -PassThru
$sb = New-Object System.Text.StringBuilder 256
$ret = $k::QueryDosDevice('COM9', $sb, 256)
Write-Host "QueryDosDevice ret=$ret path=$($sb.ToString())"
