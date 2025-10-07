# Tutorial 2: Organizing Receipts with Categories

**Estimated time**: 15 minutes  
**Difficulty**: Beginner

## What You'll Learn

- Understanding the category system
- Creating custom categories
- Organizing with subcategories
- Managing category settings
- Best practices for categorization

## Prerequisites

- Completed [Tutorial 1: Creating Your First Receipt](tutorial-01-first-receipt.md)
- At least 3-5 receipts in your account

## Understanding Categories

Categories are the primary way to organize receipts in docGator. Think of them as filing cabinet drawers.

### Default Categories

docGator provides these default categories:
- **Food & Dining**: Restaurants, groceries, coffee
- **Travel**: Hotels, flights, car rentals, gas
- **Office Supplies**: Stationery, equipment, software
- **Utilities**: Electric, water, internet, phone
- **Entertainment**: Movies, events, subscriptions
- **Healthcare**: Medical, dental, pharmacy
- **Personal**: Clothing, haircuts, personal items
- **Business Expenses**: Client meetings, marketing
- **Other**: Miscellaneous items

## Step 1: View Your Categories

1. Click **Settings** in the navigation
2. Select **Categories** from the sidebar
3. You'll see all available categories

The Categories page shows:
- Category name
- Number of receipts in each
- Color coding
- Edit/delete options

## Step 2: Create Your First Custom Category

Let's create a category for "Home Improvement":

1. Click **"+ New Category"** button
2. Fill in the form:
   - **Name**: `Home Improvement`
   - **Description**: `Hardware, tools, home repairs`
   - **Color**: Choose blue
   - **Icon**: Select hammer icon

3. Click **Create**

Your new category appears in the list!

## Step 3: Create Subcategories

Subcategories provide additional organization within main categories.

Let's add subcategories to "Home Improvement":

1. Click on **"Home Improvement"** category
2. Click **"+ Add Subcategory"**
3. Create these subcategories:
   - **Hardware**: Screws, nails, tools
   - **Paint**: Paint, brushes, supplies
   - **Plumbing**: Pipes, fixtures, supplies
   - **Electrical**: Wires, outlets, switches

4. Click **Save All**

Now you have a hierarchical structure:
```
Home Improvement
├── Hardware
├── Paint
├── Plumbing
└── Electrical
```

## Step 4: Categorize Existing Receipts

Now let's organize some receipts:

### Single Receipt Categorization

1. Go to **Receipts** page
2. Click on a receipt
3. Click **Edit**
4. Select **Category**: Home Improvement > Hardware
5. Click **Save**

### Bulk Categorization

Categorize multiple receipts at once:

1. Go to **Receipts** page
2. Enable selection mode (checkbox in header)
3. Select 3-5 receipts
4. Click **Bulk Actions** menu
5. Select **Change Category**
6. Choose **Food & Dining**
7. Click **Apply**

All selected receipts now have the same category!

## Step 5: Create a Business Category System

Let's set up categories for business expense tracking:

### Create Main Business Categories

1. **Client Entertainment**
   - Subcategories: Meals, Events, Gifts

2. **Marketing & Advertising**
   - Subcategories: Online Ads, Print Materials, Events

3. **Professional Development**
   - Subcategories: Courses, Books, Conferences

4. **Equipment**
   - Subcategories: Computers, Software, Office Equipment

### Implementation

For each category:
1. Click **"+ New Category"**
2. Enter name and description
3. Choose appropriate color
4. Select relevant icon
5. Add subcategories
6. Click **Create**

## Step 6: Category Settings

Customize how categories work:

1. Go to **Settings** > **Categories**
2. Click **Category Settings** (gear icon)

Configure:
- **Require Category**: Force category on all receipts
- **Default Category**: Auto-assign for new receipts
- **Category Order**: Drag to reorder
- **Archived Categories**: Hide unused categories

### Enable Required Categories

1. Toggle **"Require Category"** ON
2. Set **Default Category** to "Other"
3. Click **Save Settings**

Now every receipt must have a category!

## Step 7: Using Categories for Filtering

Categories make finding receipts easy:

### Filter by Category

1. Go to **Receipts** page
2. Click **Filter** button
3. Select **Category**
4. Check categories to include:
   - ☑ Food & Dining
   - ☑ Travel
5. Click **Apply**

Only receipts in those categories show.

### Advanced Category Filters

Use search operators:
- `category:"Food & Dining"` - Exact match
- `category:Food*` - Starts with "Food"
- `category:!(Other)` - Exclude "Other"

## Step 8: Category-Based Reports

Generate reports by category:

1. Go to **Reports** page
2. Click **"+ New Report"**
3. Configure report:
   - **Date Range**: Last 30 days
   - **Group By**: Category
   - **Include Subcategories**: Yes
4. Click **Generate**

The report shows spending by category:
```
Food & Dining:        $450.00
Travel:               $823.00
Office Supplies:      $125.00
Home Improvement:     $315.00
Total:              $1,713.00
```

## Step 9: Color Coding Strategy

Use colors strategically:

### Color Scheme Examples

**By Type:**
- 🔴 Red: Personal expenses
- 🔵 Blue: Business expenses
- 🟢 Green: Reimbursable
- 🟡 Yellow: Tax deductible

**By Priority:**
- 🔴 Red: High priority review
- 🟡 Yellow: Medium priority
- 🟢 Green: Archived/processed

**By Department:**
- 🔵 Blue: Marketing
- 🟢 Green: Operations
- 🟣 Purple: Development
- 🟡 Yellow: Sales

### Apply Your Color Scheme

1. Go to **Settings** > **Categories**
2. Click **Edit** on each category
3. Change color to match your scheme
4. Click **Save**

## Step 10: Category Best Practices

### Do's ✅

- **Keep it Simple**: Start with 5-10 main categories
- **Be Consistent**: Use same categories for similar items
- **Use Subcategories**: Add detail without cluttering
- **Review Regularly**: Archive unused categories
- **Document System**: Write down category definitions

### Don'ts ❌

- **Too Many Categories**: Avoid 50+ top-level categories
- **Duplicate Categories**: No overlap in purpose
- **Vague Names**: Be specific and clear
- **Frequent Changes**: Stick with your system
- **Over-Nesting**: Max 2-3 subcategory levels

## Step 11: Category Maintenance

Keep categories organized:

### Monthly Review
1. Check for receipts in "Other"
2. Recategorize as needed
3. Look for patterns needing new categories

### Quarterly Cleanup
1. Archive unused categories
2. Merge similar categories
3. Update category descriptions
4. Review color scheme

### Archive Categories
1. Go to **Settings** > **Categories**
2. Click **Edit** on category
3. Click **Archive**
4. Confirm action

Archived categories remain on old receipts but don't appear in dropdowns.

## Real-World Examples

### Personal Finance System
```
📱 Personal
├── Groceries
├── Dining Out
├── Clothing
└── Entertainment

🏠 Home
├── Rent/Mortgage
├── Utilities
├── Maintenance
└── Furnishings

🚗 Transportation
├── Gas
├── Parking
├── Maintenance
└── Insurance

💼 Income-Related
├── Work Expenses
├── Professional Development
└── Work Travel
```

### Small Business System
```
💰 Revenue
├── Product Sales
├── Service Income
└── Other Income

💸 Operating Expenses
├── Rent
├── Utilities
├── Insurance
└── Equipment

👥 Employee Costs
├── Salaries
├── Benefits
└── Training

📢 Marketing
├── Advertising
├── Website
└── Events

🛒 Inventory
├── Raw Materials
├── Finished Goods
└── Shipping
```

## Practice Exercise

Create a category system for your needs:

1. Identify 5-7 main expense categories
2. Create them in docGator
3. Add 2-3 subcategories to each
4. Choose appropriate colors
5. Categorize 10 existing receipts
6. Generate a category report

## What You Learned

✅ Understand category hierarchy  
✅ Create custom categories  
✅ Use subcategories effectively  
✅ Bulk categorize receipts  
✅ Filter and report by category  
✅ Apply best practices  

## Next Steps

- **Tutorial 3**: [Generating Expense Reports](tutorial-03-reports.md)
- **Tutorial 4**: [Using Advanced Search](tutorial-04-search.md)
- Learn about [Tags for flexible organization](../concepts.md)

## Need Help?

- Review [Basic Concepts](../concepts.md)
- Check [FAQ](../faq.md)
- Contact support: support@docgator.app

**Great job!** You now have a solid understanding of organizing with categories. 🎉
