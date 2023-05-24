# Allow RDP connections
(Get-WmiObject -Class "Win32_TerminalServiceSetting" -Namespace root\cimv2
\terminalservices).SetAllowTsConnections(1)

# Disable NLA
(Get-WmiObject -class "Win32_TSGeneralSetting" -Namespace root\cimv2\terminalservices –Filter "TerminalName='RDP-tcp'").SetUserAuthenticationRequired(0)

# Allow RDP on the firewall
Get-NetFirewallRule -DisplayGroup "Remote Desktop" | Set-NetFirewallRule -Enabled True
