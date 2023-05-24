$inifile = "d:\config.ini"
$readini = Get-IniContent $inifile
$User = $readini["Username"].UserID
$User
