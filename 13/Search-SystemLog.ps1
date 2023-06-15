function Search-SystemLog {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string]$Path,
        [Parameter(Mandatory=$true)]
        [string[]]$SearchPatterns
    )

    Get-Content -Path $Path | Select-String -Pattern $SearchPatterns
}
