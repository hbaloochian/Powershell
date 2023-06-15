function TextCoder {
    [CmdletBinding()]
    param (
        [string] $Text = "")

    if ([string]::IsNullOrEmpty($Text)){
        $Text = Read-Host “Enter text to be encoded ”
    }
    $By = [System.Text.Encoding]::Unicode.GetBytes($Text)
    $output =[Convert]::ToBase64String($By)
    $output
    }

function TextDecoder {
    [CmdletBinding()]
    param (
        [string] $Text = "")

    if ([string]::IsNullOrEmpty($Text)){
        $Text = Read-Host “Enter text to be encoded ”
    }
    $output = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($Text))
    $output

    }

function FileCoder {
    [CmdletBinding()]
    param (
        [string] $FileName = "")

    if ([string]::IsNullOrEmpty($FileName)){
        $FileName = Read-Host “Enter file path to be encoded ”
    }
    if (!(Test-Path $FileName -PathType Leaf)){
        $FileName = Read-Host “Not found! Enter file path to be encoded ”
    }
    $FileContent = Get-Content $FileName
    $fileContentInBytes = [System.Text.Encoding]::UTF8.GetBytes($FileContent)
    $fileContentEncoded = [System.Convert]::ToBase64String($fileContentInBytes)
    $fileContentEncoded | Set-content ($fileName + ".b64")
    Write-Host "[+] File Encoded Successfully! $FileName.b64"
    }

function FileDecoder {
    [CmdletBinding()]
    param (
        [string] $FileName = "")

    if ([string]::IsNullOrEmpty($FileName)){
        $FileName = Read-Host “Enter file path to be encoded ”
    }
    if (!(Test-Path $FileName -PathType Leaf)){
        $FileName = Read-Host “Not found! Enter file path to be encoded ”
    }
    $FileContent = Get-Content $FileName
    $fileContentDecoded = [System.Convert]::FromBase64String($FileContent)
    $fileContentInBytes = [System.Text.Encoding]::UTF8.GetString($fileContentDecoded)
    $fileContentInBytes | Set-content ($fileName + ".Decode")
    Write-Host "[+] File Encoded Successfully! $FileName.Decode"
    }
