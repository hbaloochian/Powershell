$reportpath = Read-Host "Enter path (default path is ""d:\ "")" 
if ([string]::IsNullOrEmpty($reportpath))
{
   $reportpath = "d:\"
}
$reportpath = $reportpath + "Report.html"
if (!(Test-Path $reportpath))
{
   $file = New-Item $reportpath 
   Write-Host "New file Created......."
} else {
  Write-Host "File already exists and new content added"
}
$report = $reportpath
Clear-Content $report
#################HTml Report Content############################
Add-Content $report "<html>"
Add-Content $report "<head>"
Add-Content $report "<meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1'>"
Add-Content $report '<title>Drive Status Report</title>'
add-content $report '<STYLE TYPE="text/css">'
add-content $report "<!--"
add-content $report "td {"
add-content $report "font-family: Tahoma;"
add-content $report "font-size: 11px;"
add-content $report "border-top: 1px solid #999999;"
add-content $report "border-right: 1px solid #999999;"
add-content $report "border-bottom: 1px solid #999999;"
add-content $report "border-left: 1px solid #999999;"
add-content $report "padding-top: 0px;"
add-content $report "padding-right: 0px;"
add-content $report "padding-bottom: 0px;"
add-content $report "padding-left: 0px;"
add-content $report "}"
add-content $report "body {"
add-content $report "margin-left: 5px;"
add-content $report "margin-top: 5px;"
add-content $report "margin-right: 0px;"
add-content $report "margin-bottom: 10px;"
add-content $report ""
add-content $report "table {"
add-content $report "border: thin solid #000000;"
add-content $report "}"
add-content $report "-->"
add-content $report "</style>"
Add-Content $report "</head>"
Add-Content $report "<body>"
add-content $report "<table width='100%'>"
add-content $report "<tr bgcolor='Lavender'>"
add-content $report "<td colspan='7' height='25' align='center'>"
add-content $report "<font face='tahoma' color='#003399' size='4'><strong>Drive Manager</strong></font>"
add-content $report "</td>"
add-content $report "</tr>"
add-content $report "</table>"
add-content $report "<table width='100%'>"
Add-Content $report "<tr bgcolor='IndianRed'>"
Add-Content $report "</tr>"
############################ReportTemplate################################
add-content $report "<tr bgcolor='Lavender'>"
add-content $report "<td colspan='7' height='25' align='center'>"
add-content $report "<font face='tahoma' color='#003399' size='4'><strong>List of your system drive</strong></font>"
add-content $report "</td>"
add-content $report "</tr>"
add-content $report "</tr>"
add-content $report "</table>"
add-content $report "<table width='100%'>"
Add-Content $report "<tr bgcolor='IndianRed'>"
Add-Content $report "<td width='10%' align='center'><B>DriveLetter</B></td>"
Add-Content $report "<td width='5%' align='center'><B>HealthStatus</B></td>"
Add-Content $report "<td width='10%' align='center'><B>FileSystemType</B></td>"
Add-Content $report "<td width='5%' align='center'><B>DriveType</B></td>"
Add-Content $report "<td width='10%' align='center'><B>SizeRemaining</B></td>"
Add-Content $report "<td width='5%' align='center'><B>Size</B></td>"
$drives = Get-Volume 
foreach ($drive in $drives) {
$driveLetter = $drive.DriveLetter
$driveHs = $drive.HealthStatus
$driveFs = $drive.FileSystemType
$driveType = $drive.DriveType
$driveRs = $drive.SizeRemaining 
if($driveRs -ge 1GB) {
   $driveRs = $driveRs / 1GB
   $driveRs = [String]([int] $driveRs) + " GB"
}else {
  $driveRs = $driveRs / 1MB 
  $driveRs = [String]([int] $driveRs) + " MB"
}

$driveSize = $drive.Size
if($driveSize -ge 1GB) {
   $driveSize = $driveSize / 1GB
   $driveSize = [String]([int] $driveSize) + " GB"
}else {
  $driveSize = $driveSize  / 1MB 
  $driveSize = [String]([int] $driveSize) + " MB"
}

Add-Content $report "<tr>"
Add-Content $report "<td bgcolor= 'GainsBoro' align=center> <B>$driveLetter</B></td>"
Add-Content $report "<td bgcolor= 'GainsBoro' align=center> <B>$driveHs</B></td>"
Add-Content $report "<td bgcolor= 'GainsBoro' align=center> <B>$driveFs</B></td>"
Add-Content $report "<td bgcolor= 'GainsBoro' align=center> <B>$driveType</B></td>"
Add-Content $report "<td bgcolor= 'GainsBoro' align=center> <B>$driveRs</B></td>"
Add-Content $report "<td bgcolor= 'GainsBoro' align=center> <B>$driveSize</B></td>"
}
##############################################################
Add-content $report "</table>"
Add-Content $report "</body>"
Add-Content $report "</html>"
Write-Host "Go to path ""$reportpath"" to view the created report file."
