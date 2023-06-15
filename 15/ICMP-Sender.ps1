cls
$ICMPClient = New-Object System.Net.NetworkInformation.Ping
$PingOptions = New-Object System.Net.NetworkInformation.PingOptions
$PingOptions.DontFragment = $True
$CIP = (Get-NetIPAddress | Where-Object {$_.AddressState -eq "Preferred" -and $_.AddressFamily -eq "IPv4" -and $_.InterfaceAlias -notlike "*Loopback*"}).IPAddress
Write-Host "Your current IP is: $CIP" 
Write-Host "-----------------------------------"

while($true){
    if (!($IP = Read-Host -Prompt "Press enter to accept ($CIP)")) {$IP = $CIP}
    $TC = Test-Connection -BufferSize 32 -Count 1 -ComputerName $IP -Quiet
    if ($TC -eq 'True'){
        cls
        Write-Host Enter clss to clear screen
        Write-Host Press Ctrl+Breeak to stop
        Write-Host --------------------------
        Write-Host 
        break
    }
    else {
        write-host Please Enter A Valid and Online Computer.
        sleep 3
        cls
    }
}
while($True){
    $text = Read-Host -Prompt "Enter your text>"
    if($text -eq "clss"){
        cls
        Write-Host Enter clss to clear screen
        Write-Host Press Ctrl+Breeak to stop
        Write-Host --------------------------
        Write-Host 
        $text=' '
    }
    $txtn = ([text.encoding]::ASCII).GetBytes("$text~")
    foreach($EncodedTxt in $txtn){
        ping -n 1 -l $EncodedTxt $IP | Out-Null
    }
}
