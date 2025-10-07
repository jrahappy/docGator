# Tutorial 3: Generating Expense Reports

**Estimated time**: 20 minutes  
**Difficulty**: Intermediate

## What You'll Learn

- Types of reports available
- Creating custom reports
- Exporting reports in different formats
- Scheduling automated reports
- Best practices for expense reporting

## Prerequisites

- Completed [Tutorial 1](tutorial-01-first-receipt.md) and [Tutorial 2](tutorial-02-categories.md)
- At least 10-15 receipts in your account
- Receipts spanning multiple categories

## Understanding Reports

Reports transform your receipt data into useful insights for:
- Tax preparation
- Expense reimbursement
- Budget tracking
- Business accounting
- Financial analysis

## Step 1: Access the Reports Page

1. Click **Reports** in the main navigation
2. You'll see:
   - Recent reports
   - Report templates
   - "Create New Report" button

## Step 2: Create Your First Report

Let's create a simple expense summary:

1. Click **"+ New Report"**
2. Choose **"Expense Summary"** template
3. Configure report:
   - **Name**: `March 2024 Expenses`
   - **Date Range**: March 1-31, 2024
   - **Group By**: Category
   - **Sort By**: Amount (Highest first)
4. Click **Generate Report**

Wait a few seconds while the report generates.

## Step 3: Review the Report

Your report displays:

### Summary Section
```
Total Expenses: $1,847.50
Number of Receipts: 32
Date Range: March 1-31, 2024
Average per Receipt: $57.73
```

### Category Breakdown
```
Food & Dining          $625.00  (33.8%)
Travel                 $420.00  (22.7%)
Office Supplies        $350.00  (18.9%)
Home Improvement       $280.00  (15.2%)
Entertainment          $172.50   (9.3%)
```

### Detailed List
Each receipt with:
- Date
- Merchant
- Category
- Amount
- Payment method

## Step 4: Customize Report Details

Modify what's included:

1. Click **Edit Report**
2. Toggle options:
   - ☑ Include receipt images
   - ☑ Show individual items
   - ☐ Include notes
   - ☑ Show payment methods
   - ☑ Include tax amounts
3. Update **Fields to Display**:
   - Date
   - Merchant
   - Category
   - Subtotal
   - Tax
   - Total
4. Click **Update Report**

## Step 5: Export Report Formats

Export your report in various formats:

### PDF Export
1. Click **Export** > **PDF**
2. Choose options:
   - **Include Images**: Yes
   - **Page Size**: Letter
   - **Orientation**: Portrait
3. Click **Generate PDF**
4. Download opens automatically

**Use for**: Email attachments, printing, archiving

### Excel Export
1. Click **Export** > **Excel**
2. Choose worksheets:
   - ☑ Summary
   - ☑ By Category
   - ☑ Detailed List
   - ☑ Charts
3. Click **Generate Excel**

**Use for**: Further analysis, pivot tables, charts

### CSV Export
1. Click **Export** > **CSV**
2. Choose delimiter:
   - Comma (default)
   - Semicolon
   - Tab
3. Click **Generate CSV**

**Use for**: Importing to accounting software, custom analysis

## Step 6: Create a Tax Report

Essential for tax preparation:

1. Click **"+ New Report"**
2. Choose **"Tax Summary"** template
3. Configure:
   - **Tax Year**: 2024
   - **Categories**: Select tax-deductible categories
     - ☑ Business Expenses
     - ☑ Office Supplies
     - ☑ Travel (Business)
     - ☑ Professional Development
   - **Tags**: Include tags
     - `#tax-deductible`
     - `#business`
4. Advanced filters:
   - **Minimum Amount**: $0.01
   - **Exclude Personal**: Yes
5. Click **Generate Report**

### Tax Report Features
- Summary by tax category
- Monthly breakdown
- Mileage summary (if applicable)
- Charitable donations section
- Home office expenses

## Step 7: Create a Reimbursement Report

For submitting expense claims:

1. Click **"+ New Report"**
2. Choose **"Reimbursement Report"** template
3. Configure:
   - **Name**: `Q1 2024 Reimbursement`
   - **Date Range**: Jan 1 - Mar 31, 2024
   - **Filter by Tag**: `#reimbursable`
   - **Status**: Pending reimbursement
4. Include:
   - ☑ Receipt images
   - ☑ Itemized details
   - ☑ Business purpose notes
5. Click **Generate Report**

### Reimbursement Checklist
The report includes:
- ✓ Clear receipt images
- ✓ Expense descriptions
- ✓ Business justification
- ✓ Date and amount
- ✓ Category classification
- ✓ Your signature line
- ✓ Submission date

## Step 8: Schedule Automated Reports

Never forget monthly reports:

1. Click **"+ New Report"**
2. Create report as usual
3. Click **Schedule** instead of Generate
4. Configure schedule:
   - **Frequency**: Monthly
   - **Day of Month**: 1st
   - **Time**: 9:00 AM
   - **Date Range**: Previous month (dynamic)
5. Delivery:
   - ☑ Email to: your@email.com
   - ☑ Save to account
   - ☐ Send to accountant
6. Click **Schedule Report**

You'll receive the report automatically!

## Step 9: Compare Time Periods

Track spending trends:

1. Click **"+ New Report"**
2. Choose **"Comparison Report"** template
3. Configure:
   - **Primary Period**: March 2024
   - **Compare To**: February 2024
   - **Group By**: Category
4. Click **Generate Report**

### Comparison View
```
Category          March    Feb      Change
Food & Dining     $625     $580     +$45 (+7.8%)
Travel            $420     $750     -$330 (-44.0%)
Office Supplies   $350     $280     +$70 (+25.0%)
Total            $1,395   $1,610   -$215 (-13.4%)
```

Great for:
- Budget monitoring
- Spending trends
- Cost control
- Anomaly detection

## Step 10: Create Report Templates

Save time with templates:

1. Create a report you use often
2. Click **Save as Template**
3. Name it: `Monthly Business Expenses`
4. Choose what to save:
   - ☑ Date range type (relative)
   - ☑ Filters and categories
   - ☑ Display options
   - ☑ Export settings
5. Click **Save Template**

Next time:
1. Click **"+ New Report"**
2. Select your template
3. Update date range
4. Click **Generate**

Much faster!

## Step 11: Advanced Filtering

Create precise reports:

### Multiple Category Filter
```
Categories: Food & Dining, Travel, Entertainment
Exclude: Personal Care
```

### Amount Range Filter
```
Minimum: $50
Maximum: $500
```

### Tag Combinations
```
Include tags: #business AND #reimbursable
Exclude tags: #personal
```

### Date Patterns
```
Day of week: Weekdays only
Time of day: Business hours (9am-5pm)
```

### Merchant Filter
```
Include: Starbucks, Peet's Coffee
Exclude: Grocery stores
```

## Step 12: Visual Reports

Create charts and graphs:

1. Generate any report
2. Click **Visualize**
3. Choose chart type:
   - **Pie Chart**: Category distribution
   - **Bar Chart**: Compare categories
   - **Line Chart**: Trends over time
   - **Area Chart**: Cumulative spending
4. Customize:
   - Colors
   - Labels
   - Legend position
5. Click **Save Visualization**

## Report Best Practices

### Do's ✅

- **Regular Schedule**: Generate reports consistently
- **Accurate Data**: Review receipts before reporting
- **Clear Names**: Use descriptive report names
- **Save Templates**: For recurring reports
- **Review Trends**: Compare to previous periods
- **Archive Reports**: Keep historical records

### Don'ts ❌

- **Last Minute**: Don't wait until deadline
- **Incomplete Data**: Fix missing information first
- **Too Broad**: Keep reports focused
- **Ignore Errors**: Review and correct issues
- **Delete Reports**: Archive instead

## Common Report Scenarios

### Monthly Business Expense Report
```
Purpose: Submit to accounting
Date Range: Previous month
Categories: All business categories
Include: Receipt images, itemization
Format: PDF + Excel
Schedule: 1st of each month
```

### Quarterly Tax Report
```
Purpose: Tax preparation
Date Range: Quarter
Categories: Tax-deductible only
Include: Full details, notes
Format: Excel for analysis
Tags: #tax-deductible
```

### Weekly Team Report
```
Purpose: Team expense tracking
Date Range: Last 7 days
Categories: Project-specific
Group By: Team member
Format: PDF summary
Email: To team lead
```

### Annual Summary
```
Purpose: Year-end review
Date Range: Full year
Categories: All
Include: Visualizations, trends
Format: PDF presentation style
```

## Troubleshooting

### Report Won't Generate
- Check date range has receipts
- Verify category filters aren't too restrictive
- Ensure receipts are saved (not draft)
- Try smaller date range

### Missing Receipts in Report
- Check receipt dates
- Verify categories match filters
- Review tag filters
- Check receipt status

### Export Fails
- Try different format
- Reduce receipt count
- Disable images temporarily
- Check file size limits

### Incorrect Totals
- Review receipt amounts
- Check for duplicates
- Verify refunds are negative
- Recalculate report

## Practice Exercise

Generate these three reports:

1. **Personal Monthly Summary**
   - Last month
   - Personal categories only
   - Group by category
   - Export as PDF

2. **Business Reimbursement**
   - Last quarter
   - Tag: #reimbursable
   - Include images
   - Export as PDF

3. **Year-to-Date Comparison**
   - This year vs last year
   - All categories
   - Visual charts
   - Save as template

## What You Learned

✅ Create various report types  
✅ Export in multiple formats  
✅ Schedule automated reports  
✅ Use advanced filtering  
✅ Create report templates  
✅ Apply best practices  

## Next Steps

- **Tutorial 4**: [Using Advanced Search](tutorial-04-search.md)
- Learn about [API Integration](../api.md)
- Explore [Business Features](../business-features.md)

## Need Help?

- Review [FAQ - Reports Section](../faq.md#search-and-reports)
- Check [Getting Started Guide](../getting-started.md)
- Contact support: support@docgator.app

**Excellent work!** You're now an expert at generating reports. 📊
