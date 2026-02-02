# Script untuk memindahkan Metode Pembayaran ke footer grid

$html = Get-Content 'index_V2.1_optimized.html' -Raw

# 1. Buat section payment baru dengan format footer-column
$newPaymentSection = @"

        <!-- Payment Methods -->
        <div class="footer-column">
          <h4>Metode Pembayaran</h4>
          <div class="footer-payment-icons">
            <img src="assets/images/payments/bca.svg" alt="BCA" class="payment-icon">
            <img src="assets/images/payments/mandiri.svg" alt="Mandiri" class="payment-icon">
            <img src="assets/images/payments/bni.svg" alt="BNI" class="payment-icon">
            <img src="assets/images/payments/bri.svg" alt="BRI" class="payment-icon">
            <img src="assets/images/payments/visa.svg" alt="Visa" class="payment-icon">
            <img src="assets/images/payments/mastercard.svg" alt="Mastercard" class="payment-icon">
          </div>
        </div>
"@

# 2. Tambahkan section payment baru sebelum penutup footer-grid
$html = $html -replace '(</ul>\s*</div>\s*</div>)(\s*<!-- ================= PAYMENT METHODS)', "$1$newPaymentSection`n      </div>`n`n<!-- ================= OLD PAYMENT SECTION REMOVED"

# 3. Hapus section payment lama (yang terpisah)
$html = $html -replace '<!-- ================= PAYMENT METHODS ================= -->[\s\S]*?</div>\s*</div>\s*\n\s*<div class="footer-bottom">', '<div class="footer-bottom">'

# Simpan
Set-Content 'index_V2.1_optimized.html' -Value $html -Encoding UTF8

Write-Host "✅ Section Metode Pembayaran berhasil dipindahkan ke footer grid"
Write-Host "   - Sekarang berada di sebelah kanan 'Hubungi Kami'"
Write-Host "   - Format mengikuti footer-column yang sama"
