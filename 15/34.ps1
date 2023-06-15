$OS = Get-CimInstance -ClassName Win32_OperatingSystem

$Culture = [System.Globalization.CultureInfo]::GetCultures("SpecificCultures") | Where {$_.LCID -eq $OS.OSLanguage}
$RegionInfo = New-Object System.Globalization.RegionInfo $Culture.Name

@{'CountryCode' = $OS.CountryCode}
@{'OSLanguage' = $os.OSLanguage}
@{'OSDefaultLanguage' = New-Object System.Globalization.CultureInfo([Int]$OS.OSLanguage)}
@{'OSCountryCode' = $RegionInfo.TwoLetterISORegionName}
@{'OSCountryName' = $RegionInfo.DisplayName}
