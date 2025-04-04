$projectPath = ($args -join ' ')
$projectName = ([io.fileinfo]$projectPath).BaseName.ToLower() -replace ' ', '-'
$exe = "C:\Program Files (x86)\PICO-8\pico8.exe"

Write-Verbose -Verbose "Launching '$exe'..."
$ps = Start-Process $exe -PassThru -ArgumentList "-run", ./build/$projectName.p8

Write-Verbose -Verbose 'Waiting for the launched process'' main window to appear...'
do {
    Write-Host . -NoNewline
    Start-Sleep -Milliseconds 300
} while (0 -eq $ps.MainWindowHandle)
Write-Host

Read-Host "Main window found; press Enter to send a close request message"

Write-Host "`n"

Write-Verbose -Verbose 'Sending close message; the return value indicates whether the message could be posted.'
$ps.CloseMainWindow()