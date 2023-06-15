$stringAsStream = [System.IO.MemoryStream]::new()
$writer = [System.IO.StreamWriter]::new($stringAsStream)
$writer.write("Hello world…………")
$writer.Flush()
$stringAsStream.Position = 0
$StrHash = Get-FileHash -InputStream $stringAsStream 
Write-Host "Algorithm is: " -NoNewline
Write-Host $StrHash.Algorithm
Write-Host
Write-Host "Hash is: " -NoNewline
Write-Host $StrHash.Hash 
