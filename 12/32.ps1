$port = 22
$net = "127.0.0."
0..255 | foreach { echo ((new-object Net.Sockets.TcpClient).Connect($net+$_,$port)) "Port $port is open on $net$_ } 2>$null
