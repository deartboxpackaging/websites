# Add security enhancements to HTML

$html = Get-Content 'index_V2.1_optimized.html' -Raw

# Add Content Security Policy
$csp = '  <meta http-equiv="Content-Security-Policy" content="default-src ''self''; script-src ''self'' ''unsafe-inline'' https://www.googletagmanager.com; style-src ''self'' ''unsafe-inline'' https://fonts.googleapis.com; font-src ''self'' https://fonts.gstatic.com; img-src ''self'' data: https:; connect-src ''self'' https://wa.me;">'

$html = $html -replace '(<meta http-equiv="Cache-Control")', "$csp`n`$1"

# Add CSRF token field to form
$csrfField = '          <input type="hidden" name="csrf_token" id="csrf_token" value="">'
$html = $html -replace '(<form id="rfqForm"[^>]*>)', "`$1`n$csrfField"

# Add script to populate CSRF token
$csrfScript = @"
  <script>
    // Populate CSRF token from sessionStorage
    document.addEventListener('DOMContentLoaded', function() {
      const token = sessionStorage.getItem('csrf_token');
      const csrfField = document.getElementById('csrf_token');
      if (csrfField && token) {
        csrfField.value = token;
      }
    });
  </script>
"@

$html = $html -replace '(<script defer src="optimized_script.js"></script>)', "$csrfScript`n`$1"

# Save
Set-Content 'index_V2.1_optimized.html' -Value $html -Encoding UTF8

Write-Host "✅ Security enhancements added:"
Write-Host "   - Content Security Policy (CSP) header"
Write-Host "   - CSRF token field in form"
Write-Host "   - CSRF token population script"
