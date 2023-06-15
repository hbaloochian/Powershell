function Get-NetworkAdapterInfo {
     [CmdletBinding()]
    Param()
    $networkAdapters = Get-NetAdapter 
    #$networkAdapters

    foreach ($adapter in $networkAdapters) {

        $ipAddress = Get-NetIPConfiguration -InterfaceAlias $adapter.Name
        $ipAddress = $ipAddress.IPv4Address.IPAddress
        $macAddress = $adapter.MacAddress
        $networkName = $adapter.Name
        $netstatus = $adapter.Status
        
        Write-Output " "
        Write-Output "Network Adapter: $networkName"
        Write-Output "IP Address: $ipAddress"
        Write-Output "MAC Address: $macAddress"
        Write-Output "Status: $netstatus"
    }
}
