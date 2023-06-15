function If-Admin-Window {  
	$user = [Security.Principal.WindowsIdentity]::GetCurrent();
	$isAdmin = (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)  
	
if($isAdmin){
	Write-host 'Is Admin Window' -BackgroundColor DarkRed -ForegroundColor White
	}
	else{
	Write-host 'Not Admin Window' -BackgroundColor DarkBlue -ForegroundColor White
	}
}

function If-Admin {
	$user = "$env:COMPUTERNAME\$env:USERNAME"
	$isAdmin = (Get-LocalGroupMember 'Administrators').Name -contains $user
if($isAdmin){
	Write-host 'Is Admin' -BackgroundColor DarkRed -ForegroundColor White
	}
	else{
	Write-host 'Not Admin' -BackgroundColor DarkBlue -ForegroundColor White
	}
}
