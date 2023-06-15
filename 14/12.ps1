$usbDevices = Get-ChildItem -Path HKLM:\SYSTEM\CurrentControlSet\Enum\USBSTOR | Where-Object {$_.PSChildName -match '^[a-zA-Z0-9]*&[a-zA-Z0-9]*'}
foreach ($device in $usbDevices)
{
    $deviceId = $device.PSChildName
    $deviceProperties = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Enum\USBSTOR\$deviceId\*" -ErrorAction SilentlyContinue
    if ($deviceProperties)
    {
        Write-Output ("Device Name: " + $deviceProperties.FriendlyName)
        Write-Output ("Manufacturer: " + $deviceProperties.Mfg)
        Write-Output ("Product ID: " + $deviceProperties.ProductId)
        Write-Output ("Serial Number: " + $deviceProperties.SerialNumber)
        Write-Output ("--------------------------")
    }
}
