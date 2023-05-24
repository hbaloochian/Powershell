Import-Module -Name ImportExcel
$data = Import-Csv .\report.csv
$data | Export-Excel -Path c:\temp\report.xlsx
