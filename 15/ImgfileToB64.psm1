################### Image To Base64 ###################
function ImgfileToB64 {
[CmdletBinding()]
param (
[Parameter (Mandatory = $True, ValueFromPipeline = $True)]
[string]$Imgfile,

[Parameter (Mandatory = $False)]
[ValidateSet('desk', 'temp')]
[string]$FilePath
)

if (!$FilePath) {$FilePath = "desk"}

$DistPath = switch ( $FilePath )
{
	"desk"  { "$Env:USERPROFILE\Desktop"
	}
	"temp" { "$env:TMP" 
	}
}

$code = [Convert]::ToBase64String((Get-Content -Path $Imgfile -Encoding Byte)) 
Set-Content -Path $DistPath\EncodeImage.txt -Value $code
}
################### Base64 To Image ###################
function B64ToImgfile {
[CmdletBinding()]
param (
[Parameter (Mandatory = $True)]
[string]$file,
[Parameter (Mandatory = $False)]
[ValidateSet('desk', 'temp')]
[string]$FilePath
)

if (!$FilePath) {$FilePath = "desk"}

$DistPath = switch ( $FilePath )
{
	"desk"  { "$Env:USERPROFILE\Desktop"
	}
	"temp" { "$env:TMP" 
	}
}
Add-Type -AssemblyName System.Drawing
$Base64 = Get-Content -Raw -Path $file
$Image = [Drawing.Bitmap]::FromStream([IO.MemoryStream][Convert]::FromBase64String($Base64))
$Image.Save("$DistPath\decImage.jpg")
}
