$net = "10.10.1."
0..255 | foreach {$r=(Resolve-DNSname -ErrorAction SilentlyContinue $net$_ | ft NameHost -HideTableHeaders |
Out-String).trim().replace("\s+","").replace("`r","").replace("`n"," "); Write-Output "$net$_ $r"} | tee ip_hostname.txt
