# Tutorial 4: Using Advanced Search

**Estimated time**: 15 minutes  
**Difficulty**: Intermediate

## What You'll Learn

- Basic and advanced search techniques
- Search operators and filters
- Saved searches and quick filters
- Search optimization tips
- Finding receipts quickly

## Prerequisites

- Completed previous tutorials or familiar with docGator
- At least 20-30 receipts in your account
- Variety of merchants, categories, and dates

## Understanding Search

Search is the fastest way to find receipts. docGator indexes:
- Merchant names
- Receipt notes
- Item descriptions
- Categories and tags
- Custom fields
- Amounts and dates

## Step 1: Basic Text Search

Start with simple searches:

### Search by Merchant
1. Click in the search bar at top
2. Type: `Starbucks`
3. Press **Enter**

Results show all Starbucks receipts.

### Search by Keyword
1. Search: `coffee`
2. Finds receipts with "coffee" in:
   - Merchant name
   - Item descriptions
   - Notes
   - Tags

### Partial Matches
1. Search: `Star`
2. Finds: Starbucks, Star Market, Starlight Cinema
3. Wildcards work automatically!

## Step 2: Date-Based Searches

Find receipts by date:

### Specific Date
```
date:2024-03-15
```
Receipts from March 15, 2024

### Date Range
```
date:2024-03-01..2024-03-31
```
All March 2024 receipts

### Relative Dates
```
date:today
date:yesterday
date:this week
date:last month
date:this year
```

### Date Shortcuts
```
date:>2024-01-01    (after Jan 1)
date:<2024-06-30    (before Jun 30)
date:>=2024-03-01   (on or after)
date:<=2024-03-31   (on or before)
```

## Step 3: Amount-Based Searches

Search by price:

### Exact Amount
```
amount:25.99
```

### Amount Range
```
amount:10..50
```
Receipts between $10 and $50

### Comparison Operators
```
amount:>100         (over $100)
amount:<50          (under $50)
amount:>=25.99      (at least $25.99)
amount:<=100        (up to $100)
```

### Combined with Text
```
Starbucks amount:<10
```
Starbucks receipts under $10

## Step 4: Category and Tag Searches

Filter by organization:

### By Category
```
category:"Food & Dining"
```
Note: Use quotes for multi-word categories

### By Subcategory
```
category:"Travel > Hotels"
```

### Multiple Categories
```
category:(Food OR Travel)
```

### By Tag
```
tag:reimbursable
tag:#business
```

### Multiple Tags (AND)
```
tag:business tag:reimbursable
```
Receipts with BOTH tags

### Multiple Tags (OR)
```
tag:(coffee OR lunch)
```
Receipts with EITHER tag

## Step 5: Advanced Search Operators

Combine conditions:

### AND Operator
```
Starbucks AND date:this month
```
Starbucks receipts this month

### OR Operator
```
category:(Food OR Dining)
```
Either category

### NOT Operator
```
NOT category:Personal
```
Exclude personal receipts

### Grouping with Parentheses
```
(Starbucks OR Peets) AND amount:>5
```

### Exact Phrase
```
"business lunch"
```
Finds exact phrase

## Step 6: Field-Specific Searches

Search specific fields:

### By Merchant
```
merchant:Walmart
merchant:Amazon*
```

### By Payment Method
```
payment:credit
payment:"debit card"
```

### By Notes
```
notes:"client meeting"
notes:reimbursable
```

### By Status
```
status:pending
status:reimbursed
status:submitted
```

### By Location
```
location:"New York"
location:NYC
```

## Step 7: Complex Search Examples

Real-world searches:

### Find Reimbursable Business Meals
```
category:"Food & Dining" tag:business tag:reimbursable
```

### Large Travel Expenses This Quarter
```
category:Travel amount:>200 date:this quarter
```

### Coffee Shops Last Month Under $10
```
(Starbucks OR Peets OR "Blue Bottle") date:last month amount:<10
```

### Receipts Without Category
```
category:none
```
or
```
-category:*
```

### Pending Reimbursements Over $50
```
status:pending amount:>50 tag:reimbursable
```

### Weekly Office Supplies
```
category:"Office Supplies" date:this week
```

## Step 8: Saved Searches

Save frequent searches:

1. Perform a search:
   ```
   tag:reimbursable status:pending
   ```

2. Click **Save Search** button

3. Name it: `Pending Reimbursements`

4. Choose options:
   - ☑ Add to quick filters
   - ☑ Show count badge
   - ☐ Email alerts

5. Click **Save**

Now access from:
- Quick filter dropdown
- Saved searches menu
- Keyboard shortcut (assigned automatically)

### Useful Saved Searches

**Personal Finance:**
- `Recent Groceries`: `category:Groceries date:this month`
- `Large Purchases`: `amount:>100`
- `This Year Personal`: `date:this year -category:Business`

**Business:**
- `Unreimbursed`: `tag:reimbursable status:pending`
- `Tax Deductible YTD`: `tag:tax-deductible date:this year`
- `Client Expenses`: `tag:client date:this quarter`

## Step 9: Quick Filters

Use preset filters:

### Filter Panel
1. Click **Filters** button (funnel icon)
2. Select options:
   - **Date Range**: This month
   - **Categories**: Food & Dining, Travel
   - **Amount**: $0 - $100
   - **Tags**: business, reimbursable
   - **Status**: Any

3. Click **Apply**

### Filter Combinations
Stack filters:
1. Apply date filter
2. Then category filter
3. Then amount filter
4. Then tag filter

Each narrows results further.

### Clear Filters
- Click **Clear All** to reset
- Or remove individual filter chips

## Step 10: Search Tips and Tricks

### Keyboard Shortcuts
- `/` or `Ctrl+K`: Focus search bar
- `Enter`: Perform search
- `Esc`: Clear search
- `↑` `↓`: Navigate results

### Search Suggestions
As you type, see:
- Recent searches
- Popular searches
- Suggested merchants
- Tag suggestions

### Auto-Complete
Search bar auto-completes:
- Merchant names
- Category names
- Tag names
- Field names

### Search History
1. Click search bar
2. See recent searches
3. Click any to repeat

### Fuzzy Matching
Typos are handled:
- `Strbucks` finds `Starbucks`
- `Amazn` finds `Amazon`
- `cofee` finds `coffee`

## Step 11: Search Performance

Optimize for speed:

### Do's ✅
- Use specific fields (`merchant:` vs plain text)
- Limit date ranges
- Combine filters efficiently
- Use saved searches for common queries

### Don'ts ❌
- Very broad searches (`*`)
- Multiple OR conditions
- Too many NOT conditions
- Huge date ranges with no other filters

### Search Limits
- Maximum 1000 results displayed
- Use filters to narrow
- Export for larger result sets

## Step 12: Mobile Search

Search on mobile:

### Voice Search
1. Tap microphone icon
2. Speak: "Starbucks last week"
3. View results

### Camera Search
1. Tap camera icon
2. Scan receipt
3. Searches for similar receipts

### Barcode Search
1. Tap scan icon
2. Scan product barcode
3. Finds related receipts

## Common Search Patterns

### Daily Use
```
# Today's expenses
date:today

# This week's spending
date:this week amount:>0

# Lunch spots
tag:lunch date:this month
```

### Weekly Review
```
# Last week's receipts
date:last week

# Uncategorized receipts
category:none date:last 7 days

# Large expenses
amount:>100 date:this week
```

### Monthly Tasks
```
# Month's reimbursable
tag:reimbursable date:this month

# Tax deductible items
tag:tax-deductible date:this month

# Category totals
category:"Food & Dining" date:this month
```

### Tax Time
```
# Year's business expenses
category:Business date:this year

# Deductible items
tag:tax-deductible date:2024

# Charitable donations
category:Charity date:2024
```

## Practice Exercises

Try these searches:

1. **Find all coffee purchases over $5 this month**
   ```
   (Starbucks OR Peets OR coffee) amount:>5 date:this month
   ```

2. **Business travel expenses pending reimbursement**
   ```
   category:Travel tag:business status:pending
   ```

3. **Last quarter's office supplies under $50**
   ```
   category:"Office Supplies" date:last quarter amount:<50
   ```

4. **Year-to-date meals with clients**
   ```
   category:"Food & Dining" tag:client date:this year
   ```

5. **Receipts without tags from last month**
   ```
   -tag:* date:last month
   ```

## Troubleshooting

### No Results Found
- Check spelling
- Broaden date range
- Remove restrictive filters
- Try partial words

### Too Many Results
- Add date range
- Include category filter
- Add amount limits
- Use more specific terms

### Wrong Results
- Use exact phrases with quotes
- Specify field (`merchant:` not plain text)
- Check category spelling
- Verify tag names

### Slow Search
- Narrow date range
- Remove OR conditions
- Simplify query
- Use saved searches

## What You Learned

✅ Basic text search  
✅ Date and amount searches  
✅ Category and tag filtering  
✅ Advanced operators (AND, OR, NOT)  
✅ Field-specific searches  
✅ Saved searches and quick filters  
✅ Search optimization  

## Next Steps

- Create 5 saved searches for your needs
- Explore [Reports](tutorial-03-reports.md) using search results
- Learn about [API Search](../api.md#search-endpoints)
- Review [Power User Tips](../power-user-guide.md)

## Need Help?

- Review [FAQ - Search Section](../faq.md#search-and-reports)
- Check [Basic Concepts](../concepts.md)
- Contact support: support@docgator.app

**Congratulations!** You're now a search expert! 🔍
