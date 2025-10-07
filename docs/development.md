# Development Setup

This guide will help you set up a local development environment for docGator.

## Prerequisites

### Required Software
- **Node.js**: v16.x or higher ([Download](https://nodejs.org/))
- **npm**: v8.x or higher (comes with Node.js)
- **Git**: Latest version ([Download](https://git-scm.com/))

### Optional Tools
- **VS Code**: Recommended editor ([Download](https://code.visualstudio.com/))
- **Docker**: For containerized development ([Download](https://www.docker.com/))
- **Postman**: For API testing ([Download](https://www.postman.com/))

## Getting the Code

### Clone the Repository

```bash
git clone https://github.com/jrahappy/docGator.git
cd docGator
```

### Install Dependencies

```bash
npm install
```

## Development Environment

### Environment Variables

Create a `.env.local` file in the root directory:

```env
# Application
NODE_ENV=development
PORT=3000
APP_URL=http://localhost:3000

# Database
DATABASE_URL=postgresql://user:password@localhost:5432/docgator_dev

# Authentication
JWT_SECRET=your-secret-key-here
JWT_EXPIRATION=7d

# Cloud Storage (optional for local dev)
AWS_ACCESS_KEY_ID=your-aws-key
AWS_SECRET_ACCESS_KEY=your-aws-secret
AWS_S3_BUCKET=docgator-dev

# OCR Service
OCR_API_KEY=your-ocr-api-key
OCR_PROVIDER=tesseract

# Email (optional for local dev)
SMTP_HOST=smtp.mailtrap.io
SMTP_PORT=2525
SMTP_USER=your-username
SMTP_PASS=your-password
```

### Database Setup

#### Using Docker (Recommended)

```bash
# Start PostgreSQL in Docker
docker-compose up -d postgres

# Run migrations
npm run db:migrate

# Seed database (optional)
npm run db:seed
```

#### Manual Setup

```bash
# Install PostgreSQL locally
# Create database
createdb docgator_dev

# Run migrations
npm run db:migrate
```

## Running the Application

### Development Server

```bash
# Start development server with hot reload
npm run dev
```

The application will be available at `http://localhost:3000`

### API Server Only

```bash
# Start API server only (port 3001)
npm run dev:api
```

### Frontend Only

```bash
# Start frontend only
npm run dev:client
```

## Project Structure

```
docGator/
├── src/
│   ├── client/           # Frontend application
│   │   ├── components/   # React components
│   │   ├── pages/        # Page components
│   │   ├── hooks/        # Custom React hooks
│   │   ├── services/     # API client services
│   │   ├── utils/        # Utility functions
│   │   └── styles/       # CSS and styling
│   │
│   ├── server/           # Backend application
│   │   ├── api/          # API routes
│   │   ├── controllers/  # Request handlers
│   │   ├── models/       # Data models
│   │   ├── services/     # Business logic
│   │   ├── middleware/   # Express middleware
│   │   └── utils/        # Utility functions
│   │
│   └── shared/           # Shared code
│       ├── types/        # TypeScript types
│       └── constants/    # Constants
│
├── tests/
│   ├── unit/            # Unit tests
│   ├── integration/     # Integration tests
│   └── e2e/             # End-to-end tests
│
├── docs/                # Documentation
├── public/              # Static assets
└── scripts/             # Build and utility scripts
```

## Development Workflow

### Creating a Feature Branch

```bash
# Create and switch to feature branch
git checkout -b feature/your-feature-name

# Make changes and commit
git add .
git commit -m "Description of changes"

# Push to remote
git push origin feature/your-feature-name
```

### Code Style

We use ESLint and Prettier for code formatting:

```bash
# Lint code
npm run lint

# Fix linting issues
npm run lint:fix

# Format code
npm run format
```

### TypeScript

Type checking:

```bash
# Check types
npm run type-check

# Watch mode
npm run type-check:watch
```

## Testing

### Running Tests

```bash
# Run all tests
npm test

# Run tests in watch mode
npm run test:watch

# Run tests with coverage
npm run test:coverage

# Run specific test file
npm test -- path/to/test.spec.ts
```

### Writing Tests

#### Unit Tests

```javascript
// Example: tests/unit/services/receiptService.test.ts
import { processReceipt } from '@/server/services/receiptService';

describe('Receipt Service', () => {
  describe('processReceipt', () => {
    it('should extract data from receipt image', async () => {
      const result = await processReceipt('test-image.jpg');
      expect(result.merchant).toBe('Test Store');
      expect(result.amount).toBe(25.99);
    });
  });
});
```

#### Integration Tests

```javascript
// Example: tests/integration/api/receipts.test.ts
import request from 'supertest';
import app from '@/server/app';

describe('Receipts API', () => {
  it('POST /api/receipts should create receipt', async () => {
    const response = await request(app)
      .post('/api/receipts')
      .attach('file', 'tests/fixtures/receipt.jpg')
      .expect(201);
    
    expect(response.body.data.id).toBeDefined();
  });
});
```

### End-to-End Tests

```bash
# Run E2E tests
npm run test:e2e

# Run E2E tests in headed mode
npm run test:e2e:headed
```

## Building

### Production Build

```bash
# Build for production
npm run build

# Start production server
npm start
```

### Docker Build

```bash
# Build Docker image
docker build -t docgator:latest .

# Run container
docker run -p 3000:3000 docgator:latest
```

## Debugging

### VS Code Debug Configuration

Create `.vscode/launch.json`:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Debug Server",
      "type": "node",
      "request": "launch",
      "runtimeExecutable": "npm",
      "runtimeArgs": ["run", "dev:api"],
      "skipFiles": ["<node_internals>/**"]
    },
    {
      "name": "Debug Tests",
      "type": "node",
      "request": "launch",
      "runtimeExecutable": "npm",
      "runtimeArgs": ["test", "--", "--runInBand"],
      "skipFiles": ["<node_internals>/**"]
    }
  ]
}
```

### Chrome DevTools

```bash
# Start with debugging enabled
node --inspect node_modules/.bin/npm run dev
```

Then open `chrome://inspect` in Chrome.

## Common Tasks

### Adding a New API Endpoint

1. Create route in `src/server/api/routes/`
2. Create controller in `src/server/controllers/`
3. Add service logic in `src/server/services/`
4. Write tests in `tests/integration/api/`
5. Update API documentation

### Adding a New Component

1. Create component in `src/client/components/`
2. Create styles (if needed)
3. Write unit tests in `tests/unit/components/`
4. Add to Storybook (if applicable)
5. Export from index file

### Database Migrations

```bash
# Create new migration
npm run db:migrate:create -- migration-name

# Run migrations
npm run db:migrate

# Rollback migration
npm run db:migrate:rollback

# Reset database
npm run db:reset
```

## Troubleshooting

### Port Already in Use

```bash
# Find process using port 3000
lsof -i :3000

# Kill process
kill -9 <PID>
```

### Node Modules Issues

```bash
# Clean install
rm -rf node_modules package-lock.json
npm install
```

### Database Connection Issues

1. Check if PostgreSQL is running
2. Verify DATABASE_URL in .env.local
3. Check database credentials
4. Ensure database exists

### Build Errors

```bash
# Clear build cache
npm run clean

# Rebuild
npm run build
```

## Resources

- [React Documentation](https://react.dev)
- [Node.js Documentation](https://nodejs.org/docs)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [Express.js Guide](https://expressjs.com/en/guide/routing.html)
- [Jest Documentation](https://jestjs.io/docs/getting-started)

## Getting Help

- Check existing [GitHub Issues](https://github.com/jrahappy/docGator/issues)
- Join our [Discord Server](https://discord.gg/docgator)
- Read the [Contributing Guide](../CONTRIBUTING.md)
- Ask questions in discussions

## Next Steps

- [Review Architecture](architecture.md)
- [Read API Documentation](api.md)
- [Check Contributing Guidelines](../CONTRIBUTING.md)
- [View Code Examples](examples.md)
