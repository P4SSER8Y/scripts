Push-Location
Set-Location -Path Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\SystemProtectedUserData
$items = Get-ChildItem .
$file = ""
foreach ($tmp in $items)
{
    $name = $tmp.Name.Split('\')[-1] + '\AnyoneRead\LockScreen\Creative'
    $file = (Get-ItemProperty $name -Name LandscapeAssetPath -ErrorAction SilentlyContinue).LandscapeAssetPath
    if ($file -match $env:USERNAME)
    {
        Write-Host Find $file
        break
    }
}
if (Test-Path $file -ErrorAction SilentlyContinue)
{
    $picPath = ('E:\Pictures\Wallpapers\' + @(Get-Date -UFormat "%Y.%m.%d.jpg"))
    Copy-Item $file $picPath
    Write-Host Copied to $picPath
    Start-Process $picPath
}else{
    Write-Host Failed
    pause
}
Pop-Location