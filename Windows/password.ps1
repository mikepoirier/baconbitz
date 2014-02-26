$oUser = [adsi]"LDAP://{dName}"
$ouser.psbase.invoke("SetPassword", {password}) 
$ouser.psbase.CommitChanges()