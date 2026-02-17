$sites = @(
  "site.site.com",
  "site.site.com",
  "site.site.com"
"
)
 
Write-Host "==== HTTPS Check ===="
 
foreach ($url in $sites) {
  try {
    $sw = [System.Diagnostics.Stopwatch]::StartNew()
 
    # HEAD is fast; fallback to GET if a site blocks HEAD
    try {
      $resp = Invoke-WebRequest -Uri $url -Method Head -TimeoutSec 30 -UseBasicParsing
    } catch {
      $resp = Invoke-WebRequest -Uri $url -Method Get -TimeoutSec 30 -UseBasicParsing
    }
 
    $sw.Stop()
    $code = [int]$resp.StatusCode
    $ms = $sw.ElapsedMilliseconds
 
    if ($code -ge 200 -and $code -lt 400) {
      Write-Host "✅ $url  ($code)  ${ms}ms" -ForegroundColor Green
    } else {
      Write-Host "⚠️  $url  ($code)  ${ms}ms" -ForegroundColor Yellow
    }
  }
  catch {
    Write-Host "❌ $url  FAILED  $($_.Exception.Message)" -ForegroundColor Red
  }
}
