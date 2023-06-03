cd ..
Get-ChildItem -Directory | foreach { Write-Host "Fetching $_" | git -C $_.FullName fetch }
Get-ChildItem -Directory | foreach { Write-Host "Cleaning for $_" | git -C $_.FullName clean -x -f -d }
Get-ChildItem -Directory | foreach { Write-Host "Cleaning submodules for $_" | git -C $_.FullName submodule foreach --recursive git clean -xfd }
Get-ChildItem -Directory | foreach { Write-Host "Reseting for $_" | git -C $_.FullName reset --hard }
Get-ChildItem -Directory | foreach { Write-Host "Reseting submodules for $_" | git -C $_.FullName submodule foreach --recursive git reset --hard }
Get-ChildItem -Directory | foreach { Write-Host "Updating submodules $_" | git -C $_.FullName submodule update --init --recursive }
Get-ChildItem -Directory | foreach { Write-Host "Getting latest for $_" | git -C $_.FullName pull --all --recurse-submodules --verbose }
$3rdParty = '.\3rdparty'
if (Test-Path -Path $3rdParty) {
    cd .\3rdparty
    Get-ChildItem -Directory | foreach { Write-Host "Cleaning for $_" | git -C $_.FullName clean -x -f -d }
    Get-ChildItem -Directory | foreach { Write-Host "Fetching for $_" | git -C $_.FullName fetch}
    Get-ChildItem -Directory | foreach { Write-Host "Pulling for $_" | git -C $_.FullName pull}
    Get-ChildItem -Directory | foreach { Write-Host "Updating submodules $_" | git -C $_.FullName pull --all --recurse-submodules --verbose }
    cd ..
}
