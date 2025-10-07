# API Documentation

Complete API reference for docGator.

## Base URL

```
Production: https://api.docgator.app/v1
Staging: https://api-staging.docgator.app/v1
```

## Authentication

### API Key Authentication

Include your API key in the header:

```http
Authorization: Bearer YOUR_API_KEY
```

### Get API Key

1. Log in to docGator
2. Go to Settings > API Keys
3. Click "Generate New Key"
4. Copy and store securely

### JWT Authentication

For web/mobile apps:

```http
POST /auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123"
}
```

Response:
```json
{
  "token": "eyJhbGciOiJIUzI1NiIs...",
  "refreshToken": "eyJhbGciOiJIUzI1NiIs...",
  "expiresIn": 604800
}
```

## Receipts

### Create Receipt

Upload a new receipt.

```http
POST /receipts
Content-Type: multipart/form-data
Authorization: Bearer YOUR_API_KEY

file: [binary]
merchant: "Starbucks"
date: "2024-03-15"
amount: 12.75
category_id: 5
```

Response (201 Created):
```json
{
  "id": "rec_abc123",
  "merchant": "Starbucks",
  "date": "2024-03-15",
  "amount": 12.75,
  "category_id": 5,
  "image_url": "https://cdn.docgator.app/receipts/...",
  "status": "processing",
  "created_at": "2024-03-15T10:30:00Z"
}
```

### Get Receipt

Retrieve a specific receipt.

```http
GET /receipts/{receipt_id}
Authorization: Bearer YOUR_API_KEY
```

Response (200 OK):
```json
{
  "id": "rec_abc123",
  "merchant": "Starbucks",
  "date": "2024-03-15",
  "amount": 12.75,
  "tax": 0.98,
  "subtotal": 11.77,
  "category": {
    "id": 5,
    "name": "Food & Dining"
  },
  "tags": ["coffee", "morning"],
  "items": [
    {
      "description": "Grande Latte",
      "amount": 5.25
    }
  ],
  "payment_method": "credit_card",
  "notes": "Morning coffee",
  "image_url": "https://cdn.docgator.app/receipts/...",
  "status": "completed",
  "created_at": "2024-03-15T10:30:00Z",
  "updated_at": "2024-03-15T10:31:00Z"
}
```

### List Receipts

Get all receipts with optional filters.

```http
GET /receipts?date_from=2024-03-01&date_to=2024-03-31&category_id=5
Authorization: Bearer YOUR_API_KEY
```

Query Parameters:
- `date_from` (ISO 8601 date)
- `date_to` (ISO 8601 date)
- `category_id` (integer)
- `merchant` (string)
- `min_amount` (decimal)
- `max_amount` (decimal)
- `tags` (comma-separated)
- `page` (integer, default: 1)
- `per_page` (integer, default: 50, max: 100)

Response (200 OK):
```json
{
  "data": [
    {
      "id": "rec_abc123",
      "merchant": "Starbucks",
      "date": "2024-03-15",
      "amount": 12.75,
      "category": { "id": 5, "name": "Food & Dining" },
      "image_url": "https://cdn.docgator.app/receipts/..."
    }
  ],
  "pagination": {
    "page": 1,
    "per_page": 50,
    "total": 142,
    "total_pages": 3
  }
}
```

### Update Receipt

Update receipt information.

```http
PATCH /receipts/{receipt_id}
Content-Type: application/json
Authorization: Bearer YOUR_API_KEY

{
  "merchant": "Starbucks Coffee",
  "amount": 12.75,
  "notes": "Updated notes"
}
```

Response (200 OK): Updated receipt object

### Delete Receipt

Move receipt to trash.

```http
DELETE /receipts/{receipt_id}
Authorization: Bearer YOUR_API_KEY
```

Response (204 No Content)

## Categories

### List Categories

```http
GET /categories
Authorization: Bearer YOUR_API_KEY
```

Response (200 OK):
```json
{
  "data": [
    {
      "id": 5,
      "name": "Food & Dining",
      "parent_id": null,
      "color": "#FF5722",
      "icon": "restaurant",
      "subcategories": [
        {
          "id": 15,
          "name": "Coffee Shops",
          "parent_id": 5
        }
      ]
    }
  ]
}
```

### Create Category

```http
POST /categories
Content-Type: application/json
Authorization: Bearer YOUR_API_KEY

{
  "name": "Home Improvement",
  "parent_id": null,
  "color": "#2196F3",
  "icon": "home"
}
```

Response (201 Created): Category object

## Tags

### List Tags

```http
GET /tags
Authorization: Bearer YOUR_API_KEY
```

Response (200 OK):
```json
{
  "data": [
    {
      "id": 1,
      "name": "reimbursable",
      "color": "#4CAF50",
      "count": 45
    }
  ]
}
```

### Add Tag to Receipt

```http
POST /receipts/{receipt_id}/tags
Content-Type: application/json
Authorization: Bearer YOUR_API_KEY

{
  "tag": "business"
}
```

Response (201 Created)

## Search

### Search Receipts

```http
GET /search?q=starbucks+amount:>5&date_from=2024-03-01
Authorization: Bearer YOUR_API_KEY
```

Query Parameters:
- `q` (search query string)
- `date_from`, `date_to`
- `page`, `per_page`

Search Query Syntax:
- Text: `starbucks`
- Amount: `amount:>10`
- Category: `category:food`
- Tags: `tag:reimbursable`
- Date: `date:2024-03-15`
- Combinations: `starbucks amount:>5 date:this month`

Response (200 OK): Same as List Receipts

## Reports

### Create Report

```http
POST /reports
Content-Type: application/json
Authorization: Bearer YOUR_API_KEY

{
  "name": "March 2024 Expenses",
  "type": "expense_summary",
  "date_from": "2024-03-01",
  "date_to": "2024-03-31",
  "category_ids": [5, 10, 15],
  "group_by": "category",
  "format": "pdf"
}
```

Response (202 Accepted):
```json
{
  "report_id": "rep_xyz789",
  "status": "processing",
  "estimated_completion": "2024-03-15T10:35:00Z"
}
```

### Get Report Status

```http
GET /reports/{report_id}
Authorization: Bearer YOUR_API_KEY
```

Response (200 OK):
```json
{
  "id": "rep_xyz789",
  "name": "March 2024 Expenses",
  "status": "completed",
  "download_url": "https://api.docgator.app/reports/rep_xyz789/download",
  "expires_at": "2024-03-22T10:35:00Z"
}
```

### Download Report

```http
GET /reports/{report_id}/download
Authorization: Bearer YOUR_API_KEY
```

Response (200 OK): Binary file content

## Webhooks

### Register Webhook

```http
POST /webhooks
Content-Type: application/json
Authorization: Bearer YOUR_API_KEY

{
  "url": "https://your-app.com/webhook",
  "events": ["receipt.created", "receipt.processed"],
  "secret": "your_webhook_secret"
}
```

### Webhook Events

- `receipt.created` - New receipt uploaded
- `receipt.processed` - OCR completed
- `receipt.updated` - Receipt modified
- `receipt.deleted` - Receipt deleted
- `report.completed` - Report ready

Webhook Payload:
```json
{
  "event": "receipt.processed",
  "timestamp": "2024-03-15T10:31:00Z",
  "data": {
    "receipt_id": "rec_abc123",
    "status": "completed"
  }
}
```

## Rate Limits

- **Free Tier**: 100 requests/hour
- **Personal Plan**: 1,000 requests/hour
- **Business Plan**: 10,000 requests/hour

Rate limit headers:
```
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 985
X-RateLimit-Reset: 1710504000
```

## Error Responses

### Error Format

```json
{
  "error": {
    "code": "invalid_request",
    "message": "Invalid date format",
    "details": {
      "field": "date",
      "expected": "ISO 8601 format"
    }
  }
}
```

### Error Codes

- `400` Bad Request - Invalid input
- `401` Unauthorized - Missing/invalid API key
- `403` Forbidden - Insufficient permissions
- `404` Not Found - Resource doesn't exist
- `429` Too Many Requests - Rate limit exceeded
- `500` Internal Server Error - Server error

## SDKs and Libraries

### JavaScript/Node.js

```bash
npm install docgator-sdk
```

```javascript
const DocGator = require('docgator-sdk');

const client = new DocGator('YOUR_API_KEY');

// Upload receipt
const receipt = await client.receipts.create({
  file: fs.createReadStream('receipt.jpg'),
  merchant: 'Starbucks',
  amount: 12.75
});

// Search receipts
const results = await client.receipts.search('starbucks amount:>5');
```

### Python

```bash
pip install docgator
```

```python
from docgator import DocGator

client = DocGator('YOUR_API_KEY')

# Upload receipt
receipt = client.receipts.create(
    file=open('receipt.jpg', 'rb'),
    merchant='Starbucks',
    amount=12.75
)

# List receipts
receipts = client.receipts.list(
    date_from='2024-03-01',
    category_id=5
)
```

## Examples

### Complete Receipt Upload Flow

```javascript
// 1. Upload receipt
const receipt = await client.receipts.create({
  file: imageFile
});

// 2. Wait for OCR processing
await client.receipts.waitForProcessing(receipt.id);

// 3. Get processed data
const processed = await client.receipts.get(receipt.id);

// 4. Update if needed
if (processed.merchant !== 'Correct Name') {
  await client.receipts.update(receipt.id, {
    merchant: 'Correct Name'
  });
}

// 5. Add tags
await client.receipts.addTag(receipt.id, 'reimbursable');
```

### Generate Monthly Report

```javascript
const report = await client.reports.create({
  name: 'Monthly Expenses',
  date_from: '2024-03-01',
  date_to: '2024-03-31',
  format: 'pdf'
});

// Poll for completion
const completed = await client.reports.wait(report.id);

// Download
const file = await client.reports.download(report.id);
fs.writeFileSync('report.pdf', file);
```

## Support

- API Status: https://status.docgator.app
- API Docs: https://docs.docgator.app/api
- Support: api-support@docgator.app
- GitHub: https://github.com/jrahappy/docGator
