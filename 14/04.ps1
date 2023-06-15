Get-NetFirewallRule | Where-Object {$_.Enabled -eq 'True'} | Select-Object DisplayName, Direction, Action, Enabled, Profile, Protocol, LocalPort, RemoteAddress