# Contributing to docGator

Thank you for your interest in contributing to docGator! This document provides guidelines and instructions for contributing.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [How to Contribute](#how-to-contribute)
- [Development Process](#development-process)
- [Coding Standards](#coding-standards)
- [Testing Guidelines](#testing-guidelines)
- [Pull Request Process](#pull-request-process)
- [Reporting Bugs](#reporting-bugs)
- [Suggesting Features](#suggesting-features)
- [Community](#community)

## Code of Conduct

### Our Pledge

We are committed to providing a welcoming and inclusive experience for everyone. We pledge to:

- Be respectful and considerate
- Accept constructive criticism gracefully
- Focus on what's best for the community
- Show empathy towards others

### Unacceptable Behavior

- Harassment or discrimination
- Trolling or insulting comments
- Publishing private information
- Unprofessional conduct

Report violations to: conduct@docgator.app

## Getting Started

### Prerequisites

Before contributing, ensure you have:

1. **GitHub Account**: Sign up at [github.com](https://github.com)
2. **Git**: Install from [git-scm.com](https://git-scm.com)
3. **Node.js**: Version 16+ from [nodejs.org](https://nodejs.org)
4. **Development Environment**: See [Development Setup](docs/development.md)

### First-Time Setup

1. **Fork the Repository**
   ```bash
   # Click "Fork" button on GitHub
   # Clone your fork
   git clone https://github.com/YOUR_USERNAME/docGator.git
   cd docGator
   ```

2. **Add Upstream Remote**
   ```bash
   git remote add upstream https://github.com/jrahappy/docGator.git
   git remote -v
   ```

3. **Install Dependencies**
   ```bash
   npm install
   ```

4. **Set Up Environment**
   ```bash
   cp .env.example .env.local
   # Edit .env.local with your settings
   ```

5. **Verify Setup**
   ```bash
   npm run dev
   # Visit http://localhost:3000
   ```

## How to Contribute

### Types of Contributions

We welcome various contributions:

- **Bug Fixes**: Fix issues or broken functionality
- **New Features**: Add new capabilities
- **Documentation**: Improve guides and docs
- **Tests**: Add or improve test coverage
- **Performance**: Optimize code or queries
- **Design**: UI/UX improvements
- **Translations**: Add language support

### Good First Issues

Look for issues labeled:
- `good first issue` - Great for newcomers
- `help wanted` - Community input needed
- `documentation` - Documentation improvements

Browse issues: https://github.com/jrahappy/docGator/issues

## Development Process

### 1. Choose an Issue

- Browse open issues
- Comment that you'd like to work on it
- Wait for assignment/approval
- Ask questions if needed

### 2. Create a Branch

```bash
# Update your fork
git checkout main
git pull upstream main

# Create feature branch
git checkout -b feature/your-feature-name
# or
git checkout -b fix/bug-description
```

Branch naming conventions:
- `feature/` - New features
- `fix/` - Bug fixes
- `docs/` - Documentation
- `refactor/` - Code refactoring
- `test/` - Test additions

### 3. Make Changes

- Write clean, readable code
- Follow coding standards (below)
- Add tests for new functionality
- Update documentation as needed
- Commit regularly with clear messages

### 4. Commit Changes

Use clear, descriptive commit messages:

```bash
git add .
git commit -m "Add receipt export to Excel feature"
```

Commit message format:
```
<type>: <short summary>

<detailed description>

Fixes #123
```

Types:
- `feat:` - New feature
- `fix:` - Bug fix
- `docs:` - Documentation
- `style:` - Formatting
- `refactor:` - Code restructuring
- `test:` - Adding tests
- `chore:` - Maintenance

Example:
```
feat: Add Excel export for receipts

- Implement Excel generation using ExcelJS
- Add export button to receipts page
- Include summary sheet with totals
- Support filtering exported receipts

Fixes #234
```

### 5. Push Changes

```bash
git push origin feature/your-feature-name
```

### 6. Create Pull Request

See [Pull Request Process](#pull-request-process) below.

## Coding Standards

### JavaScript/TypeScript

#### Style Guide

- Use **TypeScript** for new files
- Use **ESLint** for linting
- Use **Prettier** for formatting
- 2 spaces for indentation
- Single quotes for strings
- Semicolons required

Run linters:
```bash
npm run lint
npm run lint:fix
npm run format
```

#### Code Structure

```typescript
// Good
export interface Receipt {
  id: string;
  merchant: string;
  amount: number;
  date: Date;
}

export function processReceipt(receipt: Receipt): ProcessedReceipt {
  // Implementation
}

// Bad
export function processReceipt(receipt: any) {
  // No type safety
}
```

#### Naming Conventions

- **Variables/Functions**: camelCase
  ```typescript
  const receiptTotal = calculateTotal(items);
  ```

- **Classes/Interfaces**: PascalCase
  ```typescript
  class ReceiptProcessor implements IProcessor
  ```

- **Constants**: UPPER_SNAKE_CASE
  ```typescript
  const MAX_FILE_SIZE = 5 * 1024 * 1024;
  ```

- **Files**: kebab-case
  ```
  receipt-processor.ts
  category-service.ts
  ```

#### Best Practices

- **DRY**: Don't Repeat Yourself
- **SOLID**: Follow SOLID principles
- **Small Functions**: Keep functions focused
- **Error Handling**: Always handle errors
- **Comments**: Explain why, not what

### React Components

#### Component Structure

```typescript
import React, { useState, useEffect } from 'react';

interface ReceiptCardProps {
  receipt: Receipt;
  onEdit: (id: string) => void;
}

export const ReceiptCard: React.FC<ReceiptCardProps> = ({ 
  receipt, 
  onEdit 
}) => {
  const [isExpanded, setIsExpanded] = useState(false);

  useEffect(() => {
    // Side effects
  }, [receipt.id]);

  const handleClick = () => {
    setIsExpanded(!isExpanded);
  };

  return (
    <div className="receipt-card" onClick={handleClick}>
      {/* JSX */}
    </div>
  );
};
```

#### Hooks

- Use functional components with hooks
- Custom hooks for reusable logic
- Follow hooks rules (top level, no conditionals)

```typescript
// Good
function useReceipts(filters: Filters) {
  const [receipts, setReceipts] = useState<Receipt[]>([]);
  const [loading, setLoading] = useState(false);
  
  useEffect(() => {
    fetchReceipts(filters).then(setReceipts);
  }, [filters]);
  
  return { receipts, loading };
}
```

### CSS/Styling

- Use **CSS Modules** or **styled-components**
- Follow **BEM** naming for plain CSS
- Mobile-first responsive design
- Use design system tokens

### Testing

See [Testing Guidelines](#testing-guidelines) below.

## Testing Guidelines

### Test Coverage

Aim for:
- **80%+ overall coverage**
- **100% for critical paths**
- **All new features tested**

### Writing Tests

#### Unit Tests

```typescript
// receipt-service.test.ts
import { processReceipt } from './receipt-service';

describe('Receipt Service', () => {
  describe('processReceipt', () => {
    it('should extract merchant name', () => {
      const result = processReceipt(mockReceiptData);
      expect(result.merchant).toBe('Starbucks');
    });

    it('should handle invalid data', () => {
      expect(() => processReceipt(null))
        .toThrow('Invalid receipt data');
    });
  });
});
```

#### Integration Tests

```typescript
// api/receipts.test.ts
import request from 'supertest';
import app from '../app';

describe('Receipts API', () => {
  it('POST /api/receipts should create receipt', async () => {
    const response = await request(app)
      .post('/api/receipts')
      .attach('file', 'test/fixtures/receipt.jpg')
      .field('merchant', 'Test Store')
      .expect(201);

    expect(response.body.id).toBeDefined();
  });
});
```

#### Component Tests

```typescript
// ReceiptCard.test.tsx
import { render, screen, fireEvent } from '@testing-library/react';
import { ReceiptCard } from './ReceiptCard';

describe('ReceiptCard', () => {
  it('should render receipt information', () => {
    render(<ReceiptCard receipt={mockReceipt} onEdit={jest.fn()} />);
    
    expect(screen.getByText('Starbucks')).toBeInTheDocument();
    expect(screen.getByText('$12.75')).toBeInTheDocument();
  });

  it('should call onEdit when edit button clicked', () => {
    const onEdit = jest.fn();
    render(<ReceiptCard receipt={mockReceipt} onEdit={onEdit} />);
    
    fireEvent.click(screen.getByRole('button', { name: /edit/i }));
    
    expect(onEdit).toHaveBeenCalledWith(mockReceipt.id);
  });
});
```

### Running Tests

```bash
# All tests
npm test

# Watch mode
npm run test:watch

# Coverage
npm run test:coverage

# Specific file
npm test -- receipt-service.test.ts
```

## Pull Request Process

### Before Submitting

1. **Update from Main**
   ```bash
   git checkout main
   git pull upstream main
   git checkout your-branch
   git rebase main
   ```

2. **Run Tests**
   ```bash
   npm test
   npm run lint
   npm run type-check
   ```

3. **Update Documentation**
   - Update README if needed
   - Add/update code comments
   - Update API docs if applicable

### Creating Pull Request

1. **Push to Your Fork**
   ```bash
   git push origin your-branch
   ```

2. **Open Pull Request on GitHub**
   - Go to your fork on GitHub
   - Click "New Pull Request"
   - Select your branch
   - Fill out the PR template

### PR Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Performance improvement

## Related Issue
Fixes #123

## Testing
- [ ] Unit tests added/updated
- [ ] Integration tests added/updated
- [ ] Manual testing completed

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Comments added for complex code
- [ ] Documentation updated
- [ ] No new warnings
- [ ] Tests pass locally
```

### Review Process

1. **Automated Checks**
   - Linting
   - Tests
   - Build
   - Coverage

2. **Code Review**
   - At least one approval required
   - Address reviewer feedback
   - Update as needed

3. **Merge**
   - Maintainer will merge
   - Squash commit if needed
   - Delete branch after merge

## Reporting Bugs

### Before Reporting

1. **Search Existing Issues**
   - Check if already reported
   - Add to existing issue if found

2. **Verify Bug**
   - Reproduce consistently
   - Test on latest version
   - Check different browsers (if UI)

### Bug Report Template

```markdown
**Describe the Bug**
Clear description of the bug

**To Reproduce**
Steps to reproduce:
1. Go to '...'
2. Click on '...'
3. Scroll down to '...'
4. See error

**Expected Behavior**
What should happen

**Actual Behavior**
What actually happens

**Screenshots**
If applicable

**Environment**
- OS: [e.g., Windows 10, macOS 12]
- Browser: [e.g., Chrome 98, Firefox 95]
- Version: [e.g., 1.2.3]

**Additional Context**
Any other information
```

## Suggesting Features

### Feature Request Template

```markdown
**Feature Description**
Clear description of the feature

**Use Case**
Why is this needed?

**Proposed Solution**
How should it work?

**Alternatives Considered**
Other approaches considered

**Additional Context**
Mockups, examples, etc.
```

## Community

### Getting Help

- **Documentation**: Check [docs/](docs/)
- **Issues**: Ask in GitHub issues
- **Discussions**: Use GitHub Discussions
- **Discord**: Join our server (coming soon)
- **Email**: support@docgator.app

### Recognition

Contributors are recognized in:
- README.md contributors section
- Release notes
- Hall of Fame page (coming soon)

### License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

**Thank you for contributing to docGator!** 🎉

Your contributions help make receipt management better for everyone.
