Get-WmiObject Win32_USBControllerDevice | ForEach-Object {
    $usbDevice = [wmi]($_.Dependent)
    if ($usbDevice.PNPDeviceID -notmatch "^USB\\\\VID_([0-9A-F]{4})&PID_([0-9A-F]{4}).*") {
        $usbClass = $usbDevice.GetRelated('Win32_USBHub')
        $usbClass | Select-Object Name, Status
    }
}
