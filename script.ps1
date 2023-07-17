$desktop = "$home\Desktop"
$allFiles = Get-ChildItem $desktop

foreach ($file in $allFiles){
    if($file -like "code*"){
        $path = "$desktop\$file"
        $newName = $file.Name -replace "code*", ''
        Rename-Item $path -NewName $newName
        $newPath = "$desktop\$newName"
        robocopy $newPath "E:\Code\$newName" /tee /np /w:0 /r:0 /xj /nfl /ndl
        Remove-Item $newPath -Recurse
    }
}