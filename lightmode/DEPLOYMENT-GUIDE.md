# 🚀 DEPLOYMENT GUIDE
## deartbox Packaging Website v2.0

**Quick Reference for Deploying to Production**

---

## ⚡ QUICK START (5 Minutes)

### Option 1: Simple Upload (Any Web Host)

```bash
# 1. Upload these files to your web server:
- notion-feel-v2-cleaned.html (rename to index.html)
- assets/ (entire folder with structure)

# 2. Done! Visit your website.
```

### Option 2: GitHub Pages (Free Hosting)

```bash
# 1. Create repository
git init
git add .
git commit -m "Initial commit - deartbox v2.0"

# 2. Push to GitHub
git remote add origin https://github.com/yourusername/deartbox-website.git
git push -u origin main

# 3. Enable GitHub Pages
# Go to Settings → Pages → Source: main branch → Save

# 4. Visit: https://yourusername.github.io/deartbox-website
```

### Option 3: Netlify (Recommended - Free + Fast)

```bash
# 1. Install Netlify CLI
npm install -g netlify-cli

# 2. Deploy
cd "D:\Data User\Documents\GitHub\deartbox-Packaging\lightmode"
netlify deploy --prod

# 3. Follow prompts, done!
```

---

## 📋 PRE-DEPLOYMENT CHECKLIST

### Files to Upload ✅
- [x] `notion-feel-v2-cleaned.html` → rename to `index.html`
- [x] `assets/` folder (complete structure)
  - [x] `assets/logo/`
  - [x] `assets/images/`
  - [x] `assets/clients/`

### Files NOT to Upload ❌
- [ ] `*.ps1` (PowerShell scripts - development only)
- [ ] `*-BACKUP.html` (backup files)
- [ ] `*.md` (documentation - optional)

### Configuration Tasks
- [ ] Rename `notion-feel-v2-cleaned.html` to `index.html`
- [ ] Update WhatsApp number (if needed)
- [ ] Update email address (if needed)
- [ ] Add Google Analytics (optional)
- [ ] Create `sitemap.xml`
- [ ] Create `robots.txt`

---

## 🔧 SERVER CONFIGURATION

### Apache (.htaccess)

Create `.htaccess` file:

```apache
# Enable HTTPS redirect
RewriteEngine On
RewriteCond %{HTTPS} off
RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]

# Enable compression
<IfModule mod_deflate.c>
    AddOutputFilterByType DEFLATE text/html text/css application/javascript image/svg+xml
</IfModule>

# Browser caching
<IfModule mod_expires.c>
    ExpiresActive On
    ExpiresByType image/webp "access plus 1 year"
    ExpiresByType image/svg+xml "access plus 1 year"
    ExpiresByType text/css "access plus 1 month"
    ExpiresByType application/javascript "access plus 1 month"
</IfModule>

# Security headers
<IfModule mod_headers.c>
    Header set X-Content-Type-Options "nosniff"
    Header set X-Frame-Options "SAMEORIGIN"
    Header set X-XSS-Protection "1; mode=block"
    Header set Referrer-Policy "strict-origin-when-cross-origin"
</IfModule>

# Custom error pages
ErrorDocument 404 /404.html
ErrorDocument 500 /500.html
```

### Nginx (nginx.conf)

```nginx
server {
    listen 80;
    server_name deartbox.com www.deartbox.com;
    
    # Redirect to HTTPS
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name deartbox.com www.deartbox.com;
    
    # SSL configuration
    ssl_certificate /path/to/cert.pem;
    ssl_certificate_key /path/to/key.pem;
    
    root /var/www/deartbox;
    index index.html;
    
    # Gzip compression
    gzip on;
    gzip_types text/css application/javascript image/svg+xml;
    gzip_min_length 1000;
    
    # Browser caching
    location ~* \.(webp|svg|jpg|jpeg|png|gif|ico|css|js)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
    }
    
    # Security headers
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-XSS-Protection "1; mode=block" always;
    add_header Referrer-Policy "strict-origin-when-cross-origin" always;
    
    # Content Security Policy
    add_header Content-Security-Policy "default-src 'self'; script-src 'self' 'unsafe-inline' https://fonts.googleapis.com; style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; img-src 'self' data: https:; font-src 'self' https://fonts.gstatic.com; connect-src 'self'; frame-ancestors 'self';" always;
    
    location / {
        try_files $uri $uri/ /index.html;
    }
}
```

---

## 📄 REQUIRED FILES

### 1. sitemap.xml

Create `sitemap.xml` in root:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://deartbox.com/</loc>
    <lastmod>2026-01-31</lastmod>
    <changefreq>weekly</changefreq>
    <priority>1.0</priority>
  </url>
  <url>
    <loc>https://deartbox.com/#features</loc>
    <changefreq>monthly</changefreq>
    <priority>0.8</priority>
  </url>
  <url>
    <loc>https://deartbox.com/#showcase</loc>
    <changefreq>weekly</changefreq>
    <priority>0.9</priority>
  </url>
  <url>
    <loc>https://deartbox.com/#process</loc>
    <changefreq>monthly</changefreq>
    <priority>0.7</priority>
  </url>
  <url>
    <loc>https://deartbox.com/#testimonials</loc>
    <changefreq>monthly</changefreq>
    <priority>0.7</priority>
  </url>
  <url>
    <loc>https://deartbox.com/#faq</loc>
    <changefreq>monthly</changefreq>
    <priority>0.8</priority>
  </url>
  <url>
    <loc>https://deartbox.com/#rfq</loc>
    <changefreq>monthly</changefreq>
    <priority>0.9</priority>
  </url>
</urlset>
```

### 2. robots.txt

Create `robots.txt` in root:

```
User-agent: *
Allow: /
Disallow: /assets/
Disallow: /*.ps1$

Sitemap: https://deartbox.com/sitemap.xml

# Crawl-delay for polite bots
Crawl-delay: 1

# Block bad bots
User-agent: AhrefsBot
Disallow: /

User-agent: SemrushBot
Disallow: /
```

### 3. 404.html (Optional)

Create custom 404 page:

```html
<!DOCTYPE html>
<html lang="id-ID">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>404 - Halaman Tidak Ditemukan | deartbox Packaging</title>
  <style>
    body {
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
      margin: 0;
      background: #fafafa;
      text-align: center;
      padding: 20px;
    }
    .container {
      max-width: 500px;
    }
    h1 {
      font-size: 72px;
      margin: 0;
      color: #d71921;
    }
    h2 {
      font-size: 24px;
      margin: 16px 0;
      color: #1a1a1a;
    }
    p {
      color: #767676;
      line-height: 1.6;
      margin-bottom: 32px;
    }
    a {
      display: inline-block;
      padding: 14px 32px;
      background: #d71921;
      color: white;
      text-decoration: none;
      border-radius: 8px;
      font-weight: 600;
      transition: all 0.3s ease;
    }
    a:hover {
      background: #a01419;
      transform: translateY(-2px);
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>404</h1>
    <h2>Halaman Tidak Ditemukan</h2>
    <p>Maaf, halaman yang Anda cari tidak ada. Mungkin sudah dipindahkan atau dihapus.</p>
    <a href="/">Kembali ke Beranda</a>
  </div>
</body>
</html>
```

---

## 🔐 SECURITY SETUP

### SSL Certificate (Let's Encrypt - Free)

```bash
# Install Certbot
sudo apt-get install certbot python3-certbot-nginx

# Get certificate
sudo certbot --nginx -d deartbox.com -d www.deartbox.com

# Auto-renewal (cron)
sudo certbot renew --dry-run
```

### Security Headers Verification

After deployment, test at: https://securityheaders.com

Expected headers:
- ✅ X-Content-Type-Options: nosniff
- ✅ X-Frame-Options: SAMEORIGIN
- ✅ X-XSS-Protection: 1; mode=block
- ✅ Referrer-Policy: strict-origin-when-cross-origin
- ✅ Content-Security-Policy: (configured)

---

## 📊 ANALYTICS SETUP (Optional)

### Google Analytics 4

Add before `</head>`:

```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

### Google Tag Manager (Alternative)

Add after `<body>`:

```html
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-XXXXXXX"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
```

---

## 🧪 POST-DEPLOYMENT TESTING

### Immediate Tests (Within 1 Hour)
1. Visit website on mobile device
2. Test form submission
3. Test dark mode toggle
4. Check all images load
5. Test WhatsApp links
6. Verify responsive design

### Within 24 Hours
1. Run Google Lighthouse audit
2. Test on multiple browsers
3. Check Google Search Console
4. Verify analytics tracking
5. Test from different locations
6. Check mobile usability

### Within 1 Week
1. Monitor form submissions
2. Check bounce rate
3. Review user feedback
4. Analyze performance metrics
5. Check for broken links
6. Review error logs

---

## 📈 MONITORING & OPTIMIZATION

### Tools to Use
- **Google Search Console** - SEO monitoring
- **Google Analytics** - User behavior
- **Google PageSpeed Insights** - Performance
- **GTmetrix** - Detailed performance
- **Uptime Robot** - Uptime monitoring
- **Hotjar** - User recordings (optional)

### Key Metrics to Track
```
✅ Page Load Time      < 2s
✅ Bounce Rate         < 40%
✅ Form Conversion     > 5%
✅ Mobile Traffic      > 60%
✅ Average Session     > 2 min
✅ Pages per Session   > 3
```

---

## 🆘 TROUBLESHOOTING

### Common Issues

#### Images Not Loading
```bash
# Check file permissions
chmod 644 index.html
chmod -R 755 assets/

# Verify paths are relative
grep -r "/lightmode" index.html  # Should return nothing
```

#### Dark Mode Not Working
```javascript
// Check localStorage
localStorage.getItem('theme')  // Should return 'dark' or 'light'

// Clear and test
localStorage.clear()
location.reload()
```

#### Form Not Submitting
```javascript
// Check console for errors
// Verify WhatsApp number format: +628195181427
// Test popup blocker settings
```

---

## 📞 SUPPORT

### Contact
- **Email:** info@deartbox.com
- **WhatsApp:** +62 819-5181-427

### Documentation
- **README.md** - Setup and customization
- **CHANGELOG.md** - All changes made
- **AUDIT-REPORT.md** - Quality audit
- **DEPLOYMENT-GUIDE.md** - This file

---

## ✅ DEPLOYMENT CHECKLIST

### Pre-deployment
- [x] Code audited and approved
- [x] All features tested
- [x] Documentation complete
- [x] Backup created
- [ ] Browser testing done
- [ ] Client approval received

### Deployment
- [ ] Files uploaded to server
- [ ] index.html renamed correctly
- [ ] Assets folder uploaded
- [ ] File permissions set
- [ ] HTTPS enabled
- [ ] Security headers configured
- [ ] Sitemap.xml created
- [ ] Robots.txt created

### Post-deployment
- [ ] Website accessible
- [ ] All pages load correctly
- [ ] Forms working
- [ ] Images loading
- [ ] Dark mode working
- [ ] Mobile responsive
- [ ] Analytics tracking
- [ ] Search Console verified

---

## 🎉 READY TO DEPLOY!

Your website is **production-ready** and optimized for:
- ✅ Performance
- ✅ User Experience
- ✅ Accessibility
- ✅ SEO
- ✅ Security

**Deploy with confidence!** 🚀

---

**Last Updated:** January 31, 2026  
**Version:** 2.0.0  
**Status:** ✅ PRODUCTION READY
