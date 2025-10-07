# Architecture Overview

This document describes the high-level architecture of docGator.

## System Architecture

docGator follows a modern three-tier architecture:

```
┌─────────────────────────────────────────────────┐
│              Client Applications                │
│  (Web App, Mobile iOS/Android, Desktop)        │
└─────────────────┬───────────────────────────────┘
                  │ HTTPS/REST API
┌─────────────────▼───────────────────────────────┐
│              API Gateway / Backend              │
│  (Node.js/Express, Authentication, Business)    │
└─────────────────┬───────────────────────────────┘
                  │
    ┌─────────────┼─────────────┬─────────────┐
    │             │             │             │
┌───▼────┐  ┌────▼─────┐  ┌───▼────┐  ┌─────▼──────┐
│Database│  │  Storage │  │  OCR   │  │   Queue    │
│Postgres│  │    S3    │  │Service │  │   Redis    │
└────────┘  └──────────┘  └────────┘  └────────────┘
```

## Components

### Frontend (Client)

**Technology Stack:**
- React 18+ with TypeScript
- Redux for state management
- React Router for navigation
- Axios for API calls
- Material-UI component library

**Key Features:**
- Progressive Web App (PWA)
- Offline capability
- Responsive design
- Real-time updates

### Backend (API Server)

**Technology Stack:**
- Node.js 16+
- Express.js framework
- TypeScript
- JWT authentication
- RESTful API design

**Key Responsibilities:**
- Request handling and routing
- Business logic execution
- Authentication and authorization
- Data validation
- Rate limiting

### Database Layer

**Primary Database: PostgreSQL**
- Receipt metadata
- User accounts
- Categories and tags
- Reports and analytics

**Schema Overview:**
```sql
users
  - id, email, password_hash, created_at

receipts
  - id, user_id, merchant, date, amount, category_id
  - image_url, status, created_at, updated_at

categories
  - id, name, parent_id, color, icon

tags
  - id, name, color

receipt_tags
  - receipt_id, tag_id

receipt_items
  - id, receipt_id, description, amount, quantity
```

**Caching: Redis**
- Session storage
- API response caching
- Job queue management

### Storage Layer

**Cloud Storage: AWS S3**
- Receipt images (original and processed)
- Report exports
- User uploads

**Storage Organization:**
```
bucket/
├── receipts/
│   ├── {user_id}/
│   │   ├── original/
│   │   └── processed/
├── reports/
│   └── {user_id}/
└── temp/
```

### OCR Service

**Technology:**
- Tesseract OCR engine
- Custom ML models for receipt parsing
- Image preprocessing pipeline

**Process Flow:**
1. Image upload
2. Image preprocessing (deskew, denoise)
3. Text extraction
4. Data parsing (merchant, date, amount)
5. Confidence scoring
6. Return structured data

### Message Queue

**Technology: Redis + Bull**
- Asynchronous job processing
- Email notifications
- Report generation
- Scheduled tasks

**Queue Types:**
- High priority: Image processing
- Normal priority: Report generation
- Low priority: Cleanup tasks

## Data Flow

### Receipt Upload Flow

```
1. User uploads image
   │
2. Frontend validates and compresses
   │
3. API receives upload
   │
4. Store original in S3
   │
5. Queue OCR job
   │
6. Return receipt ID to user
   │
7. OCR processes image (async)
   │
8. Extract and parse data
   │
9. Update receipt record
   │
10. Notify user via WebSocket
```

### Search Flow

```
1. User enters search query
   │
2. Frontend debounces input
   │
3. API receives search request
   │
4. Parse query string
   │
5. Build SQL query
   │
6. Check cache for results
   │
7. Execute database query
   │
8. Format and return results
   │
9. Cache results
   │
10. Frontend displays results
```

## Security Architecture

### Authentication
- JWT tokens with 7-day expiration
- Refresh tokens for extended sessions
- Secure HTTP-only cookies
- Password hashing with bcrypt

### Authorization
- Role-based access control (RBAC)
- Resource-level permissions
- API key authentication for integrations

### Data Protection
- Encryption at rest (AES-256)
- Encryption in transit (TLS 1.3)
- Database encryption
- Secure key management (AWS KMS)

### API Security
- Rate limiting (100 requests/minute)
- Input validation and sanitization
- SQL injection prevention
- XSS protection
- CORS configuration

## Scalability Considerations

### Horizontal Scaling
- Stateless API servers
- Load balancer (AWS ALB)
- Auto-scaling groups
- Database read replicas

### Performance Optimization
- CDN for static assets (CloudFront)
- Image optimization and lazy loading
- Database indexing
- Query optimization
- Caching strategy

### High Availability
- Multi-AZ deployment
- Database failover
- S3 replication
- Health checks and monitoring

## Monitoring and Observability

### Logging
- Application logs (Winston)
- Access logs (Morgan)
- Error tracking (Sentry)
- Log aggregation (CloudWatch)

### Metrics
- API response times
- Database query performance
- Cache hit rates
- OCR accuracy rates
- Error rates

### Alerting
- Service health checks
- Error rate thresholds
- Performance degradation
- Security incidents

## Development and Deployment

### Development Environment
- Local Docker Compose setup
- Mock services for third parties
- Seed data for testing

### CI/CD Pipeline
```
Code Push
   │
GitHub Actions
   │
├─ Lint & Type Check
├─ Unit Tests
├─ Integration Tests
└─ Build Docker Image
   │
Deploy to Staging
   │
Automated Tests
   │
Manual Approval
   │
Deploy to Production
```

### Deployment Strategy
- Blue-green deployments
- Zero-downtime updates
- Database migrations
- Rollback procedures

## Technology Choices

### Why PostgreSQL?
- ACID compliance
- Rich query capabilities
- JSON support
- Full-text search
- Strong community

### Why React?
- Component reusability
- Large ecosystem
- Performance (Virtual DOM)
- Developer experience

### Why Node.js?
- JavaScript full-stack
- Non-blocking I/O
- Rich package ecosystem
- Good for real-time features

### Why S3?
- Scalability
- Durability (99.999999999%)
- Cost-effective
- Integration with AWS services

## Future Considerations

### Planned Improvements
- GraphQL API option
- Real-time collaboration
- Advanced ML for categorization
- Blockchain for audit trails
- Multi-region support

### Technical Debt
- Migrate to microservices (phased)
- Improve test coverage
- Optimize database queries
- Refactor legacy code
- Update dependencies

## See Also
- [Development Setup](development.md)
- [API Documentation](api.md)
- [Database Schema](database-schema.md)
- [Deployment Guide](deployment.md)
