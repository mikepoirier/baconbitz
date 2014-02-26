# Function Find Distinguished Name 
function findDN { param([string]$adfindtype, [string]$cName) 
    # Create A New ADSI Call 
    $root = [ADSI]'' 
    # Create a New DirectorySearcher Object 
    $searcher = new-object System.DirectoryServices.DirectorySearcher($root) 
    # Set the filter to search for a specific CNAME 
    $searcher.filter = "(&(objectClass=$adfindtype) (CN=$cName))" 
    # Set results in $adfind variable 
    $adfind = $searcher.findall() 
     
    # If Search has Multiple Answers  
    if ($adfind.count -gt 1) { 
        $count = 0  
        foreach($i in $adfind) 
        { 
            # Write Answers On Screen 
            write-host $count ": " $i.path 
            $count += 1 
        } 
        # Prompt User For Selection 
        $selection = Read-Host "Please select item: " 
        # Return the Selection 
        return $adfind[$selection].path 
    } 
    # Return The Answer 
    return $adfind[0].path 
}