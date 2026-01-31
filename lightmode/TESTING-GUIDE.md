# 🧪 TESTING GUIDE
## deartbox Packaging Website v2.0

**Manual Testing Checklist for Quality Assurance**

---

## 📱 DEVICE TESTING

### Mobile Testing (Required)

#### iPhone Testing
- [ ] **iPhone SE (375x667)** - Small screen
  - [ ] Navigation menu works
  - [ ] Form fields are usable
  - [ ] Buttons are tappable (48x48px)
  - [ ] Text is readable (16px+)
  - [ ] Swipe gestures work
  
- [ ] **iPhone 12/13 (390x844)** - Standard
  - [ ] Hero slideshow displays correctly
  - [ ] All sections visible
  - [ ] Sticky CTA doesn't block content
  - [ ] Dark mode toggle works
  
- [ ] **iPhone 14 Pro Max (430x932)** - Large
  - [ ] Layout uses space efficiently
  - [ ] Images scale properly
  - [ ] No excessive whitespace

#### Android Testing
- [ ] **Samsung Galaxy S21 (360x800)**
  - [ ] Chrome Mobile compatibility
  - [ ] Touch interactions smooth
  - [ ] Form validation works
  
- [ ] **Google Pixel 6 (412x915)**
  - [ ] All features functional
  - [ ] Performance is smooth

#### Tablet Testing
- [ ] **iPad (768x1024)** - Portrait
  - [ ] 2-column layouts display
  - [ ] Navigation is accessible
  - [ ] Forms are comfortable to use
  
- [ ] **iPad Pro (1024x1366)** - Landscape
  - [ ] Desktop-like experience
  - [ ] All features work
  - [ ] Hover states appropriate

### Desktop Testing (Required)

- [ ] **1920x1080** - Full HD
  - [ ] Layout centered properly
  - [ ] Max-width respected (1280px)
  - [ ] Hover effects work
  
- [ ] **1366x768** - Laptop
  - [ ] All content visible
  - [ ] No horizontal scroll
  
- [ ] **2560x1440** - 2K
  - [ ] Scales appropriately
  - [ ] Images sharp

---

## 🌐 BROWSER TESTING

### Desktop Browsers

#### Google Chrome (Required)
- [ ] Page loads correctly
- [ ] All animations smooth
- [ ] Form validation works
- [ ] Dark mode toggle works
- [ ] FAQ accordion works
- [ ] File upload works
- [ ] Console has no errors

#### Mozilla Firefox (Required)
- [ ] Same as Chrome checklist
- [ ] Backdrop-filter works
- [ ] CSS Grid displays correctly

#### Safari (Mac - If Available)
- [ ] WebP images load
- [ ] Smooth scroll works
- [ ] Touch events work (trackpad)

#### Microsoft Edge (Required)
- [ ] Same as Chrome checklist
- [ ] No compatibility warnings

### Mobile Browsers

#### Safari iOS (Required)
- [ ] No zoom on input focus
- [ ] Swipe gestures work
- [ ] Sticky elements position correctly
- [ ] Dark mode respects system

#### Chrome Mobile (Required)
- [ ] Touch targets adequate
- [ ] Scroll performance smooth
- [ ] Form submission works

---

## ✨ FEATURE TESTING

### 1. Navigation
- [ ] **Desktop Menu**
  - [ ] All links work
  - [ ] Smooth scroll to sections
  - [ ] Active state highlights
  - [ ] Hover effects smooth
  
- [ ] **Mobile Menu**
  - [ ] Hamburger toggle works
  - [ ] Menu slides in smoothly
  - [ ] Overlay appears
  - [ ] Links close menu
  - [ ] Swipe to close works
  - [ ] Escape key closes menu

### 2. Hero Slideshow
- [ ] **Auto-play**
  - [ ] Slides change every 5 seconds
  - [ ] Smooth transitions
  - [ ] Dots update correctly
  
- [ ] **Manual Controls**
  - [ ] Previous button works
  - [ ] Next button works
  - [ ] Dot navigation works
  - [ ] Swipe left/right works (mobile)
  
- [ ] **Pause on Hover**
  - [ ] Auto-play pauses on hover
  - [ ] Resumes on mouse leave

### 3. Dark Mode
- [ ] **Toggle Button**
  - [ ] Button visible in header
  - [ ] Click toggles theme
  - [ ] Icon changes (sun ↔ moon)
  - [ ] Smooth transition
  
- [ ] **Theme Persistence**
  - [ ] Preference saved to localStorage
  - [ ] Persists on page reload
  - [ ] Respects system preference (first visit)
  
- [ ] **Visual Check**
  - [ ] All text readable
  - [ ] Colors inverted properly
  - [ ] Images visible
  - [ ] Contrast sufficient

### 4. Form Validation
- [ ] **Name Field**
  - [ ] Required validation
  - [ ] Minimum 2 characters
  - [ ] Shows green checkmark when valid
  - [ ] Shows error message when invalid
  
- [ ] **WhatsApp Field**
  - [ ] Auto-formats: 0819-1234-567
  - [ ] Validates Indonesian format (08xx)
  - [ ] Shows error for invalid numbers
  - [ ] Green checkmark when valid
  
- [ ] **Email Field**
  - [ ] Format validation
  - [ ] Typo suggestions (gmial → gmail)
  - [ ] Shows error for invalid email
  - [ ] Green checkmark when valid
  
- [ ] **Other Fields**
  - [ ] Industry dropdown works
  - [ ] Box type dropdown works
  - [ ] Quantity accepts numbers only
  - [ ] Message textarea expandable

### 5. File Upload
- [ ] **Click to Upload**
  - [ ] File picker opens
  - [ ] Accepts JPG, PNG, PDF
  - [ ] Rejects other formats
  - [ ] Shows error for > 5MB
  
- [ ] **Drag & Drop**
  - [ ] Drop zone highlights on dragover
  - [ ] Files upload on drop
  - [ ] Multiple files supported
  
- [ ] **Preview**
  - [ ] Image preview shows
  - [ ] File name displays
  - [ ] File size shows
  - [ ] Remove button works

### 6. Form Submission
- [ ] **Validation**
  - [ ] Prevents submit if errors
  - [ ] Shows toast notification for errors
  - [ ] All required fields enforced
  
- [ ] **Loading State**
  - [ ] Button shows spinner
  - [ ] Button disabled during submit
  - [ ] Text changes to "Mengirim..."
  
- [ ] **Success**
  - [ ] WhatsApp opens with pre-filled message
  - [ ] Success modal appears
  - [ ] Form resets
  - [ ] LocalStorage cleared
  - [ ] Can close modal

### 7. Auto-save
- [ ] **Functionality**
  - [ ] Type in form fields
  - [ ] Wait 30 seconds
  - [ ] Reload page
  - [ ] Data should be restored
  
- [ ] **Clear on Submit**
  - [ ] Submit form
  - [ ] Reload page
  - [ ] Form should be empty

### 8. FAQ Accordion
- [ ] **Expand/Collapse**
  - [ ] Click question to expand
  - [ ] Click again to collapse
  - [ ] Only one open at a time
  - [ ] Smooth animation
  - [ ] Icon rotates
  
- [ ] **Accessibility**
  - [ ] Keyboard navigable (Tab)
  - [ ] Enter/Space toggles
  - [ ] aria-expanded updates

### 9. Sticky Elements
- [ ] **Sticky Header**
  - [ ] Sticks to top on scroll
  - [ ] Glassmorphism effect appears
  - [ ] Shadow increases on scroll
  
- [ ] **Sticky CTA**
  - [ ] Visible on page load
  - [ ] Hides when scrolling down
  - [ ] Shows when scrolling up
  - [ ] Hides when footer visible
  - [ ] Opens WhatsApp on click
  
- [ ] **Back to Top**
  - [ ] Appears after 500px scroll
  - [ ] Smooth scroll to top
  - [ ] Hidden on mobile

### 10. Animations
- [ ] **Scroll Animations**
  - [ ] Section titles fade in
  - [ ] Cards stagger on appear
  - [ ] Smooth and not jarring
  
- [ ] **Scroll Progress**
  - [ ] Red bar at top
  - [ ] Grows as you scroll
  - [ ] Reaches 100% at bottom
  
- [ ] **Number Counter**
  - [ ] "50+ brands" counts up
  - [ ] Triggers when visible
  - [ ] Smooth animation
  
- [ ] **Parallax**
  - [ ] Hero section moves slower
  - [ ] Subtle effect
  - [ ] Disabled on reduced motion

### 11. Trust Marquee
- [ ] **Auto-scroll**
  - [ ] Logos scroll continuously
  - [ ] Smooth animation
  - [ ] No gaps or jumps
  
- [ ] **Pause on Hover**
  - [ ] Animation pauses
  - [ ] Resumes on mouse leave

---

## 🔍 FUNCTIONAL TESTING

### User Flows

#### Flow 1: First-time Visitor
1. [ ] Land on homepage
2. [ ] See hero with slideshow
3. [ ] Scroll through sections
4. [ ] Read features
5. [ ] View portfolio
6. [ ] Read testimonials
7. [ ] Check FAQ
8. [ ] Fill RFQ form
9. [ ] Submit successfully

#### Flow 2: Mobile User
1. [ ] Open on mobile
2. [ ] Toggle mobile menu
3. [ ] Navigate to section
4. [ ] Swipe through slideshow
5. [ ] Toggle dark mode
6. [ ] Fill form (with auto-save)
7. [ ] Upload file
8. [ ] Submit form
9. [ ] See success modal

#### Flow 3: Accessibility User
1. [ ] Use Tab to navigate
2. [ ] Use skip to content
3. [ ] Navigate with keyboard only
4. [ ] Fill form with keyboard
5. [ ] Submit with Enter
6. [ ] Close modal with Escape

---

## 🐛 BUG TESTING

### Common Issues to Check

#### Images
- [ ] All images load (no broken icons)
- [ ] WebP format supported
- [ ] Lazy loading works
- [ ] Alt text present
- [ ] Proper aspect ratios

#### Links
- [ ] All internal links work (#features, #showcase, etc)
- [ ] External links open in new tab
- [ ] WhatsApp links formatted correctly
- [ ] Email mailto works
- [ ] Social media links work

#### Forms
- [ ] All fields accept input
- [ ] Validation triggers correctly
- [ ] Error messages clear
- [ ] Success modal appears
- [ ] WhatsApp opens with data

#### JavaScript
- [ ] No console errors
- [ ] All event listeners work
- [ ] LocalStorage works
- [ ] IntersectionObserver works
- [ ] Animations smooth

#### CSS
- [ ] No layout shifts
- [ ] Consistent spacing
- [ ] Proper alignment
- [ ] Colors correct
- [ ] Fonts load

---

## 📊 PERFORMANCE TESTING

### Google Lighthouse

1. Open Chrome DevTools (F12)
2. Go to Lighthouse tab
3. Select:
   - [x] Performance
   - [x] Accessibility
   - [x] Best Practices
   - [x] SEO
4. Click "Generate report"

**Expected Scores:**
- Performance: 90+
- Accessibility: 92+
- Best Practices: 90+
- SEO: 95+

### PageSpeed Insights

1. Visit: https://pagespeed.web.dev/
2. Enter your URL
3. Check both Mobile and Desktop scores

**Expected:**
- Mobile: 85+
- Desktop: 95+

### GTmetrix

1. Visit: https://gtmetrix.com/
2. Enter your URL
3. Check Performance and Structure scores

**Expected:**
- Performance: A (90+)
- Structure: A (95+)

---

## ♿ ACCESSIBILITY TESTING

### WAVE Tool

1. Visit: https://wave.webaim.org/
2. Enter your URL
3. Check for:
   - [ ] 0 Errors
   - [ ] 0 Contrast Errors
   - [ ] All ARIA labels present
   - [ ] All images have alt text

### Keyboard Navigation

1. [ ] Tab through all interactive elements
2. [ ] Focus visible on all elements
3. [ ] Logical tab order
4. [ ] Can submit form with keyboard
5. [ ] Can close modals with Escape
6. [ ] Can navigate menu with arrows

### Screen Reader (Optional)

1. Enable screen reader (NVDA/JAWS/VoiceOver)
2. [ ] All content announced
3. [ ] Form labels read correctly
4. [ ] Buttons described properly
5. [ ] Images have descriptive alt text

---

## 🔒 SECURITY TESTING

### Input Validation

1. [ ] Try submitting empty form → Should show errors
2. [ ] Enter invalid email → Should show error
3. [ ] Enter invalid phone → Should show error
4. [ ] Upload 10MB file → Should reject
5. [ ] Upload .exe file → Should reject

### XSS Testing

1. [ ] Try entering `<script>alert('xss')</script>` in form
2. [ ] Should be escaped/sanitized
3. [ ] No alert should appear

### External Links

1. [ ] All external links have `rel="noopener noreferrer"`
2. [ ] Open in new tab
3. [ ] No referrer leakage

---

## 📋 FINAL CHECKLIST

### Before Going Live
- [ ] All tests passed
- [ ] No console errors
- [ ] All images load
- [ ] Forms work correctly
- [ ] Dark mode works
- [ ] Mobile responsive
- [ ] Lighthouse score > 90
- [ ] Accessibility score > 90
- [ ] Client approval received

### Deployment
- [ ] Files uploaded
- [ ] index.html renamed
- [ ] sitemap.xml uploaded
- [ ] robots.txt uploaded
- [ ] 404.html uploaded
- [ ] Security headers configured
- [ ] HTTPS enabled
- [ ] Analytics added (optional)

### Post-deployment
- [ ] Website accessible
- [ ] SSL certificate valid
- [ ] All features work in production
- [ ] Forms submit correctly
- [ ] Analytics tracking (if added)
- [ ] Search Console verified
- [ ] Sitemap submitted

---

## 🎯 TEST RESULTS TEMPLATE

Use this template to document your testing:

```
=== TESTING RESULTS ===
Date: [DATE]
Tester: [NAME]
Environment: [BROWSER/DEVICE]

PASSED TESTS:
✅ [Feature 1]
✅ [Feature 2]
...

FAILED TESTS:
❌ [Issue 1] - [Description]
❌ [Issue 2] - [Description]

NOTES:
- [Any observations]
- [Performance notes]
- [User feedback]

OVERALL STATUS: [PASS/FAIL]
```

---

## 🚀 QUICK TEST (5 Minutes)

If you're short on time, test these critical features:

1. [ ] **Load Page** - Opens without errors
2. [ ] **Mobile Menu** - Toggle works
3. [ ] **Dark Mode** - Toggle works
4. [ ] **Form Submit** - Opens WhatsApp
5. [ ] **Responsive** - Looks good on mobile

If all 5 pass → **Ready to deploy!** ✅

---

## 📞 SUPPORT

If you find any issues during testing:
- Email: info@deartbox.com
- WhatsApp: +62 819-5181-427

---

**Happy Testing!** 🧪✨
