# Add security fixes to optimized_script.js

$js = Get-Content 'optimized_script.js' -Raw

# Add security functions at the beginning
$securityFunctions = @"
// ================ SECURITY FUNCTIONS ================

// XSS Protection: HTML Entity Encoding
function escapeHtml(text) {
  const map = {
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#039;',
    '/': '&#x2F;'
  };
  return String(text).replace(/[&<>"'/]/g, m => map[m]);
}

// CSRF Token Generation
function generateCSRFToken() {
  const array = new Uint8Array(32);
  crypto.getRandomValues(array);
  return Array.from(array, byte => byte.toString(16).padStart(2, '0')).join('');
}

// Initialize CSRF token on page load
const csrfToken = generateCSRFToken();
sessionStorage.setItem('csrf_token', csrfToken);

// Rate Limiter
const RateLimiter = {
  attempts: 0,
  lastAttempt: 0,
  maxAttempts: 3,
  cooldown: 30000, // 30 seconds

  canSubmit() {
    const now = Date.now();
    if (now - this.lastAttempt > this.cooldown) {
      this.attempts = 0;
    }
    if (this.attempts >= this.maxAttempts) {
      return false;
    }
    this.attempts++;
    this.lastAttempt = now;
    return true;
  }
};

"@

# Insert security functions after 'use strict'
$js = $js -replace "('use strict';)", "`$1`n`n$securityFunctions"

# Fix form submission to use escapeHtml
$js = $js -replace "const name = formData\.get\('name'\);", "const name = escapeHtml(formData.get('name'));"
$js = $js -replace "const whatsapp = formData\.get\('whatsapp'\);", "const whatsapp = escapeHtml(formData.get('whatsapp'));"
$js = $js -replace "const email = formData\.get\('email'\);", "const email = escapeHtml(formData.get('email'));"
$js = $js -replace "const brand = formData\.get\('brand'\)", "const brand = escapeHtml(formData.get('brand') || '-')"
$js = $js -replace "const message = formData\.get\('message'\);", "const message = escapeHtml(formData.get('message'));"

# Add rate limiting to form submission
$js = $js -replace "(rfqForm\.addEventListener\('submit', function\(e\) \{[\s\S]*?e\.preventDefault\(\);)", "`$1`n`n    // Rate limiting check`n    if (!RateLimiter.canSubmit()) {`n      alert('Terlalu banyak percobaan. Mohon tunggu 30 detik.');`n      return;`n    }"

# Save enhanced JavaScript
Set-Content 'optimized_script.js' -Value $js -Encoding UTF8

Write-Host "✅ Security fixes added to optimized_script.js"
Write-Host "   - XSS protection (HTML escaping)"
Write-Host "   - CSRF token generation"
Write-Host "   - Rate limiting (3 attempts per 30 seconds)"
