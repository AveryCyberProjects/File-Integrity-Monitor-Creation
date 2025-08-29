
Write-Host ""
Write-Host "What would you like to do today?"
Write-Host ""

Write-Host "A) Collect a new baseline"
Write-Host "B) Begin monitoring files with already saved baseline"
Write-Host ""

$response = Read-Host -Prompt "Please enter 'A' OR 'B'"
Write-Host ""

Function Calculate-File-Hash($filepath) {
   $filehash = Get-FileHash -Path $filepath -Algorithm SHA512
    return $filehash

}

Function Erase-Baseline-If-Aleady-Exists(){
$baselineExists = Test-Path -Path .\baseline.txt

if ($baselineExists) {
    #Delete it
    Remove-Item -Path .\baseline.txt
    }
}

if ($response -eq "A".ToUpper()) {
    #Delete baseline.txt if it already exists 
    Erase-Baseline-If-Aleady-Exists

    #Calculate Hash from the target files and store in baseline.txt

    #Collect all files in target folder
    $files = Get-ChildItem -Path .\Files

    #For each file, calculate the hash, and write to baseline.txt
    foreach ($f in $files) {
    $hash = Calculate-File-Hash $f.FullName 
    "$($hash.Path)|$($hash.hash)" | Out-File -FilePath .\baseline.txt -Append
    }


    Write-Host "New Baseline created for baseline.txt" -ForegroundColor cyan
}
elseif ($response -eq "B".ToUpper()) {

    $fileHashDictionary = @{}
    
    #Load file|hash from baseline.txt and sore them in a dictionary
    $filePathsAndHashes = Get-Content -Path .\baseline.txt

    foreach ($f in $filePathsAndHashes) {
    $fileHashDictionary.add($f.split("|")[0], $f.split("|")[1])
    }
    }
    

    #Begin (continuously) monitoring files with saved Baseline
    while ($true) {
        Start-Sleep -Seconds 1

         $files = Get-ChildItem -Path .\Files

    #For each file, calculate the hash, and write to baseline.txt
    foreach ($f in $files) {
    $hash = Calculate-File-Hash $f.FullName 
    #"$($hash.Path)|$($hash.hash)" | Out-File -FilePath .\baseline.txt -Append


        #Notify if a new file has been created
        if ($fileHashDictionary[$hash.Path] -eq $null) {
        #A new file has been created!
        Write-Host "$($hash.Path) has been created!" -ForegroundColor Green
        }

    else{
        #Notify if a new file has been changed
         if ($fileHashDictionary[$hash.Path] -eq $hash.Hash) {
         #The file has not changed
         }
    
    else {
    #File has been compromised!, notify the user
    Write-Host "$($hash.Path) has changed!!!" -ForegroundColor Yellow
    }
 }  

 foreach ($key in $fileHashDictionary.Keys){
    $baselineFileStillExists = Test-Path -Path $key
    if (-Not $baselineFileStillExists) {
    #One of the baseline files must have been deleted, notify the user!
    Write-Host "$($key) has been deleted!" -ForegroundColor Red
}
}
}
}