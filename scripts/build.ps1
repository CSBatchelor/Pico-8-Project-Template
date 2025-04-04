$projectName = ([io.fileinfo]$args[0]).BaseName.ToLower() -replace ' ', '-'
$fileDir = $args[0] + "/src"

if (-Not (Test-Path $fileDir)) {
    Write-Host "Source directory $fileDir does not exist, exiting build process."
    exit
}

$luaFiles = Get-ChildItem -Path $fileDir -Recurse -Filter "*.lua"
if (-Not $luaFiles) {
    Write-Host "No .lua files found in $fileDir or its subdirectories, exiting build process."
    exit
}

$result = $luaFiles | Get-Content | Out-String

$p8Path = "build/$projectName.p8"

if (-Not (Test-Path $p8Path)) {
    Write-Host "Creating new PICO-8 cartridge at $p8Path"
    Set-Content -Path $p8Path -Value "pico-8 cartridge`nversion 42`n__lua__`n`n__gfx__`n"
}
Write-Host $result
Write-Host "Building PICO-8 cartridge... ($p8Path)"
(Get-Content -path $p8Path -Raw) -replace '(?ms)(?:__lua__)(.*)(?:__gfx__)', "__lua__`n$result`n__gfx__" | Set-Content -Path $p8Path

Start-Sleep -Milliseconds 300

Write-Host "Reloading PICO-8..."
Start-Process ./scripts/reload-pico8.exe