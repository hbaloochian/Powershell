$dir = dir "D:\data"
$dir | Select-Object Name, FullName, Attributes
$dir | select Name, FullName, Attributes
