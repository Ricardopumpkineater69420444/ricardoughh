$Users = Get-LocalUser

try {
    $Admins = Get-LocalGroupMember -Group "Administrators" | Select-Object -ExpandProperty Name
}
catch {
    $Admins = @()
}

$Report = foreach ($User in $Users) {

    $IsAdmin = if ($Admins -contains $User.Name) { "Yes" } else { "No" }

    $LastLogon = $User.LastLogon
    if ($null -eq $LastLogon) {
        $LastLogon = "No"
    }

    $Flag = ""
    if ($User.Enabled -and $LastLogon -eq "No") {
        $Flag = "Enabled - Never Logged In"
    }

    [PSCustomObject]@{
        Name          = $User.Name
        Enabled       = $User.Enabled
        LastLogon     = $LastLogon
        Administrator = $IsAdmin
        Flag          = $Flag
    }
}

$Report | Export-Csv "C:\Temp\UserAccountReport.csv" -NoTypeInformation

Write-Host "User Account Report Complete"
Write-Host "Report saved to C:\Temp\UserAccountReport.csv"
