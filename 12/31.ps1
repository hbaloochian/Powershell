$ports = "21 22 23 25 53 80 88 111 139 389 443 445 873 1099 1433 1521 1723 2049 2100 2121 3299 3306 3389 3632 4369 5038 5060 5432 5555 5900 5985 6000 6379 6667 8000 8080 8443 9200 27017"
$ip = "127.0.0.1"
$ports.split(" ") | % {echo ((new-object Net.Sockets.TcpClient).Connect($ip,$_)) "Port $_ is open on $ip"} 2>$null
