Function Inspect-DirSyncAdmins{
	$path = New-Item -ItemType Directory -Force -Path "$($path)\DirSync"

	$Users = Get-AzureADUser -All $true | where-Object {$_.DirSyncEnabled -eq $true}

	$adminRoles = Get-AzureADDirectoryRole | Where-Object {$_.DisplayName -like "*Administrator"}

	$dirsyncAdmins = @()

	ForEach ($role in $adminRoles) {
		$roleMembers = Get-AzureADDirectoryRoleMember -ObjectId $role.ObjectId

		Foreach ($user in $users) {
			If ($roleMembers -contains $User) {
				$dirsyncAdmins += $user.UserPrincipalName
				$user | Export-Csv "$path\$($role.DisplayName).csv" -Append -NoTypeInformation
			}
		}
	}
	
	If ($dirsyncAdmins.count -ne 0){
		return $dirsyncAdmins
	}

	Return $null
}

Return Inspect-DirSyncAdmins