Function Inspect-PasswordSync{
	$permissions = Get-MsolCompanyInformation

		If (($permissions.DirectorySynchronizationEnabled -eq $true) -and ($permissions.PasswordSynchronizationEnabled -eq $true)) {
			$pwdSync = $permissions.LastPasswordSyncTime
			return "Password Synchronization is enabled. Last synced $pwdSync"
		}
	Return $null
}

Return Inspect-PasswordSync