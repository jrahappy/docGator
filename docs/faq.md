# Frequently Asked Questions (FAQ)

## General Questions

### What is docGator?
docGator is a receipt management system that helps you digitize, organize, and manage receipts for personal or business use.

### Is docGator free?
We offer:
- **Free Tier**: Up to 50 receipts per month
- **Personal Plan**: $9.99/month for unlimited receipts
- **Business Plan**: Custom pricing for teams

### What file formats are supported?
- Images: JPG, PNG, HEIC, WebP
- Documents: PDF
- Email: Forward receipts as attachments

### Is my data secure?
Yes! We use:
- 256-bit encryption for data at rest
- TLS 1.3 for data in transit
- SOC 2 Type II certified infrastructure
- Regular security audits

## Getting Started

### How do I create an account?
Visit our website or download the mobile app, then click "Sign Up" and follow the prompts.

### Can I try before signing up?
Yes! Use our demo account to explore features without creating an account.

### Do I need a credit card for the free tier?
No, the free tier requires no payment information.

## Using docGator

### How accurate is the OCR?
Our OCR accuracy rates:
- Merchant name: ~90%
- Date: ~95%
- Total amount: ~85%
- Individual items: ~70%

Always review extracted data for accuracy.

### Can I edit receipt information?
Yes! All fields can be manually edited after upload.

### What happens if I delete a receipt?
Deleted receipts go to trash for 30 days before permanent deletion. You can restore them during this period.

### Can I bulk upload receipts?
Yes! Upload up to 50 receipts at once via web interface or use our bulk import API.

### How do I organize receipts?
Use a combination of:
- Categories (broad classifications)
- Tags (flexible labels)
- Folders (collections)
- Custom fields

## Search and Reports

### How does search work?
Use natural language queries or specific filters:
- `Starbucks last month`
- `amount:>50 category:travel`
- `tag:reimbursable date:2024-01`

### What report formats are available?
- PDF (formatted report with images)
- Excel (spreadsheet with data)
- CSV (raw data export)
- JSON (for developers)

### Can I customize reports?
Yes! Choose:
- Date ranges
- Categories to include/exclude
- Fields to display
- Sorting options
- Include/exclude receipt images

### How do I share reports?
- Download and email
- Generate shareable link (expires in 7 days)
- Export to cloud storage (Dropbox, Google Drive)
- Send directly to email addresses

## Mobile App

### Is there a mobile app?
Yes! Available for iOS and Android.

### Does the mobile app work offline?
Yes! Capture receipts offline and sync when connected.

### Can I scan receipts with my phone camera?
Yes! The app has built-in camera functionality with edge detection and auto-cropping.

### How do I sync between devices?
Syncing is automatic when signed in to the same account.

## Business Features

### Can multiple users access the same account?
Yes, with our Business Plan. Add team members and set permissions.

### What are user roles?
- **Admin**: Full access and billing
- **Manager**: Add receipts, generate reports, manage categories
- **User**: Add receipts, view own receipts
- **Viewer**: Read-only access to reports

### How do I set up approval workflows?
Business Plan includes customizable approval workflows for expense reimbursement.

### Can I integrate with accounting software?
Yes! We integrate with:
- QuickBooks
- Xero
- FreshBooks
- Sage
- Custom integrations via API

## Technical Questions

### Is there an API?
Yes! Our REST API allows:
- Upload receipts
- Retrieve receipt data
- Search and filter
- Generate reports
- Manage categories and tags

See [API Documentation](api.md) for details.

### Can I export all my data?
Yes! Export all receipts and data at any time in multiple formats.

### What browsers are supported?
- Chrome (latest 2 versions)
- Firefox (latest 2 versions)
- Safari (latest 2 versions)
- Edge (latest 2 versions)

### Do you have a desktop app?
Currently web and mobile apps only. Desktop app coming soon!

## Billing and Account

### How do I upgrade my plan?
Go to Settings > Billing > Change Plan

### What payment methods do you accept?
- Credit/debit cards (Visa, Mastercard, Amex)
- PayPal
- ACH (Business Plan only)

### Can I cancel anytime?
Yes! Cancel anytime without penalties. Access continues until end of billing period.

### What happens to my data if I cancel?
Data remains accessible for 60 days. Download your data before this period ends.

### Do you offer refunds?
Yes, 30-day money-back guarantee for annual plans.

## Privacy and Compliance

### Where is my data stored?
In secure data centers in the US, EU, or Asia (based on your location).

### Are you GDPR compliant?
Yes! We comply with GDPR, CCPA, and other privacy regulations.

### Can I delete all my data?
Yes! Request complete data deletion from Settings > Privacy.

### Do you sell my data?
Never! We do not sell, rent, or share your data with third parties.

### How long do you retain data?
- Active accounts: Indefinitely
- Cancelled accounts: 60 days
- Deleted accounts: 30 days in backup, then permanently removed

## Troubleshooting

### Receipt image is blurry
- Ensure good lighting
- Hold phone steady
- Use auto-focus feature
- Clean camera lens

### OCR not working correctly
- Ensure receipt is flat and fully visible
- Check image quality
- Try re-uploading with better image
- Manually edit extracted data

### Can't find a receipt
- Check all categories and folders
- Try different search terms
- Check trash folder
- Contact support if issue persists

### App won't sync
- Check internet connection
- Log out and log back in
- Clear app cache
- Update to latest version

### Report generation fails
- Check date range isn't too large
- Reduce number of receipts in report
- Try different format
- Contact support if issue persists

## Still Have Questions?

- **Email**: support@docgator.app
- **Live Chat**: Available on website (Mon-Fri, 9am-5pm EST)
- **Community Forum**: community.docgator.app
- **Video Tutorials**: youtube.com/docgator
- **Documentation**: docs.docgator.app

We typically respond to support requests within 24 hours.
