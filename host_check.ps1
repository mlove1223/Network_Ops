$sites = @(
  "atlas.sram.com",
  "https://pdm.sram.com/Windchill/app/",
  "jupyter.sram.com",
  "gttdbs.sram.com",
  "https://pdm-qa.sram.com/Windchill/app/",
  "https://pdm-dv.sram.com/Windchill/app/",
  "https://kbase.sram.com/",
  "swiki.sram.com",
  "psp.sram.com",
  "serilook.sram.com",
  "cqf.sram.com/cqfs.php",
  "https://sram-prod.mdm.stibosystems.com/#",
  "https://sram-preprod.mdm.stibosystems.com/#",
  "https://sram-dev.mdm.stibosystems.com/#"
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
