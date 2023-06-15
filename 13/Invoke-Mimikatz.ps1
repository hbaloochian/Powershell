function Invoke-Mimikatz {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$Command
    (

    $mimikatzPath = "C:\Tools\Mimikatz.exe"
    $arguments = "/c $Command"

$process = Start-Process -FilePath $mimikatzPath -ArgumentList $arguments -Wait -NoNewWindow -PassThru
    $output = $process.StandardOutput.ReadToEnd()

    Write-Output $output
}
