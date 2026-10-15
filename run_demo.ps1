# AEGIS-NEO 1-Click Demo Launcher for Windows PowerShell
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "   AEGIS-NEO | NASA Space Apps Planetary Defense Suite    " -ForegroundColor White
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "[+] Launching Local Demo Server on port 8080..." -ForegroundColor Green

$port = 8080
$url = "http://localhost:$port"

# Check if Python is available
if (Get-Command python -ErrorAction SilentlyContinue) {
    Write-Host "[+] Starting Python HTTP server..." -ForegroundColor Cyan
    Start-Process "python" -ArgumentList "-m http.server $port" -NoNewWindow
    Start-Sleep -Seconds 2
    Write-Host "[+] Opening $url in default browser..." -ForegroundColor Yellow
    Start-Process $url
} else {
    Write-Host "[!] Python not found. Opening index.html directly via default browser..." -ForegroundColor Yellow
    Start-Process "$PSScriptRoot\index.html"
}

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "   DEMO ACTIVE! Press Ctrl+C in terminal to stop server.   " -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan
