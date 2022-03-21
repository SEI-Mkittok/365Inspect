Function Inspect-ADFSConfiguration {
	$orgs_with_ADFS = @()
	Get-OrganizationConfig | 
		ForEach-Object -Process {if ($null -ne $_.AdfsIssuer) {$orgs_with_ADFS += $_.Name;}}
		
	If ($orgs_with_ADFS.Count -NE 0) {
		return $orgs_with_ADFS
	}
	
	return $null
}

Return Inspect-ADFSConfiguration
