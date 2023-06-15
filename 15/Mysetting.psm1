function change_background($background_name) {
    Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'Wallpaper' -Value $background_name
    rundll32.exe user32.dll, UpdatePerUserSystemParameters
}

function change_system_name($system_name) {
    Rename-Computer -NewName $system_name -Force -Restart
}

function get_current_user() {
    $user = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $username = $user.Name.Split('\')[1]
    return $username }
