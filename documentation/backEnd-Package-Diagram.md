# CampusConnect Backend - Package Structure

## File System Structure

```
CampusConnect-backend/
├── LICENSE
├── logs.json
├── package.json
├── README.md
├── test_logs_endpoint.js
├── test_logs.js
├── docs/
│   ├── createTables.md
│   ├── package-diagram.md
│   └── package-structure-markdown.md
└── src/
    ├── server.js                    # Application entry point
    ├── config/
    │   └── db.js                    # Database configuration
    ├── controllers/
    │   ├── admin.controller.js      # Admin request handlers
    │   ├── auth.controller.js       # Authentication handlers
    │   ├── club.controller.js       # Club management handlers
    │   ├── event.controller.js      # Event management handlers
    │   ├── facility.controller.js   # Facility management handlers
    │   ├── post.controller.js       # Post management handlers
    │   ├── room.controller.js       # Room booking handlers
    │   └── user.controller.js       # User management handlers
    ├── middlewares/
    │   └── auth.middleware.js       # JWT authentication middleware
    ├── repositories/
    │   ├── auth.repository.js       # Authentication data access
    │   ├── club.repository.js       # Club data access
    │   ├── event.repository.js      # Event data access
    │   ├── facility.repository.js   # Facility data access
    │   ├── post.repository.js       # Post data access
    │   ├── room.repository.js       # Room data access
    │   └── user.repository.js       # User data access
    ├── routes/
    │   ├── admin.route.js           # Admin API routes
    │   ├── auth.route.js            # Authentication routes
    │   ├── club.route.js            # Club API routes
    │   ├── event.route.js           # Event API routes
    │   ├── facility.route.js        # Facility API routes
    │   ├── post.route.js            # Post API routes
    │   ├── room.route.js            # Room API routes
    │   └── user.route.js            # User API routes
    ├── scripts/
    │   ├── createTables.js          # Database schema setup
    │   └── testingConnection.js     # DB connectivity test
    ├── services/
    │   ├── admin.service.js         # Admin business logic
    │   ├── auth.service.js          # Authentication logic
    │   ├── club.service.js          # Club business logic
    │   ├── event.service.js         # Event business logic
    │   ├── facility.service.js      # Facility business logic
    │   ├── post.service.js          # Post business logic
    │   ├── room.service.js          # Room business logic
    │   └── user.service.js          # User business logic
    └── utils/
        ├── log.js                   # Logging utilities
        └── logs.js                  # Log processing
```

## Business Domain Packages

### Logical Subsystems Organization

```
Authentication Package
├── AuthRoute class
│   ├── Dependencies: Express Router
│   └── Endpoints: POST /api/auth/login
├── AuthController class
│   ├── Methods: login()
│   └── Dependencies: AuthService
├── AuthService class
│   ├── Methods: login(), generateToken(), validateCredentials()
│   ├── Dependencies: AuthRepository, ClubService, bcryptjs, jsonwebtoken
│   └── Cross-package: Uses ClubService for role determination
└── AuthRepository class
    ├── Methods: findUserByEmail()
    ├── Dependencies: DatabaseConfig
    └── Tables: users

User Management Package
├── UserRoute class
│   ├── Dependencies: Express Router, AuthMiddleware
│   └── Endpoints: User CRUD operations
├── UserController class
│   ├── Methods: User management operations
│   └── Dependencies: UserService
├── UserService class
│   ├── Methods: Business logic for user operations
│   └── Dependencies: UserRepository
└── UserRepository class
    ├── Methods: User data access operations
    ├── Dependencies: DatabaseConfig
    └── Tables: users

Event Management Package
├── EventRoute class
│   ├── Dependencies: Express Router, AuthMiddleware
│   └── Endpoints: Event CRUD operations
├── EventController class
│   ├── Methods: Event management operations
│   └── Dependencies: EventService
├── EventService class
│   ├── Methods: Event business logic, scheduling
│   └── Dependencies: EventRepository
└── EventRepository class
    ├── Methods: Event data access operations
    ├── Dependencies: DatabaseConfig
    └── Tables: events

Club Management Package
├── ClubRoute class
│   ├── Dependencies: Express Router, AuthMiddleware
│   └── Endpoints: Club CRUD operations
├── ClubController class
│   ├── Methods: Club management operations
│   └── Dependencies: ClubService
├── ClubService class
│   ├── Methods: Club business logic, manager validation
│   ├── Dependencies: ClubRepository
│   └── Cross-package: Used by AuthService
└── ClubRepository class
    ├── Methods: Club data access operations
    ├── Dependencies: DatabaseConfig
    └── Tables: clubs

Post Management Package
├── PostRoute class
│   ├── Dependencies: Express Router, AuthMiddleware
│   └── Endpoints: Post CRUD operations
├── PostController class
│   ├── Methods: Post management operations
│   └── Dependencies: PostService
├── PostService class
│   ├── Methods: Post business logic, content management
│   └── Dependencies: PostRepository
└── PostRepository class
    ├── Methods: Post data access operations
    ├── Dependencies: DatabaseConfig
    └── Tables: posts

Room Management Package
├── RoomRoute class
│   ├── Dependencies: Express Router, AuthMiddleware
│   └── Endpoints: Room booking operations
├── RoomController class
│   ├── Methods: Room booking operations
│   └── Dependencies: RoomService
├── RoomService class
│   ├── Methods: Room booking logic, availability
│   └── Dependencies: RoomRepository
└── RoomRepository class
    ├── Methods: Room data access operations
    ├── Dependencies: DatabaseConfig
    └── Tables: rooms

Facility Management Package
├── FacilityRoute class
│   ├── Dependencies: Express Router, AuthMiddleware
│   └── Endpoints: Facility CRUD operations
├── FacilityController class
│   ├── Methods: Facility management operations
│   └── Dependencies: FacilityService
├── FacilityService class
│   ├── Methods: Facility business logic
│   └── Dependencies: FacilityRepository
└── FacilityRepository class
    ├── Methods: Facility data access operations
    ├── Dependencies: DatabaseConfig
    └── Tables: facilities

Admin Management Package
├── AdminRoute class
│   ├── Dependencies: Express Router, AuthMiddleware
│   └── Endpoints: Administrative operations
├── AdminController class
│   ├── Methods: Administrative operations
│   └── Dependencies: AdminService
├── AdminService class
│   ├── Methods: Administrative business logic
│   ├── Dependencies: UserRepository (direct access)
│   └── Cross-package: Direct repository access pattern
└── AdminRepository class (implicit)
    ├── Uses: UserRepository for user management
    └── Pattern: Administrative operations on existing entities

Infrastructure Package
├── DatabaseConfig class
│   ├── Dependencies: mariadb || aivencloud, dotenv
│   ├── Methods: getConnection(), pool management
│   └── Purpose: Database connectivity
├── AuthMiddleware class
│   ├── Dependencies: jsonwebtoken
│   ├── Methods: verifyToken()
│   └── Purpose: JWT validation
├── LogUtils class
│   ├── Methods: Logging operations
│   └── Dependencies: logs.js
└── LogsProcessor class
    ├── Methods: Log processing and management
    └── Dependencies: log.js

Database Scripts Package
├── CreateTablesScript class
│   ├── Dependencies: DatabaseConfig
│   └── Purpose: Database schema initialization
└── ConnectionTestScript class
    ├── Dependencies: DatabaseConfig
    └── Purpose: Database connectivity verification
```

### Inter-Package Dependencies

```
Authentication Package → Club Management Package
    └── AuthService uses ClubService for role determination

Admin Management Package → User Management Package
    └── AdminService directly accesses UserRepository

All Business Packages → Infrastructure Package
    └── All packages depend on DatabaseConfig and AuthMiddleware

Infrastructure Package → External Dependencies
    └── Uses Express, MariaDB || aivencloud, JWT, etc.
```

## Package Architecture Overview

    - **express** - Web application framework

-   **mariadb || aivencloud** - Database driver for MariaDB || aivencloud connections
-   **jsonwebtoken** - JWT token generation and verification
-   **bcryptjs** - Password hashing and verification
-   **multer** - File upload handling middleware
-   **cors** - Cross-Origin Resource Sharing middleware
-   **helmet** - Security headers middleware
-   **morgan** - HTTP request logging
-   **node-cron** - Task scheduling
-   **joi** - Data validation library
-   **dotenv** - Environment variable management

---

## Application Structure

### Entry Point

```Package Diagram

server.js
├── Dependencies: express, dotenv, cors, helmet, morgan, multer
├── Routes Mounted:
│   ├── /api/auth → auth.route.js
│   ├── /api/admin → admin.route.js (protected)
│   ├── /api/users → user.route.js (protected)
│   └── /api/events → event.route.js (protected)
└── Middleware: auth.middleware.js (global protection)
```

---

## Configuration Layer

### Database Configuration

```
config/
└── db.js
    ├── Dependencies: mariadb || aivencloud, dotenv
    ├── Creates: Database connection pool
    └── Exports: getConnection() function
```

### Environment Variables

```
.env
├── DB_HOST
├── DB_PORT
├── DB_USER
├── DB_PASSWORD
├── DB_NAME
└── PORT
```

---

## Middleware Layer

### Authentication Middleware

```
middlewares/
└── auth.middleware.js
    ├── Dependencies: jsonwebtoken
    ├── Function: verifyToken()
    └── Purpose: JWT validation for protected routes
```

---

## Routes Layer

### Route Modules

```
routes/
├── auth.route.js
│   ├── Dependencies: express Router, auth.controller.js
│   └── Endpoints: POST /login
├── admin.route.js
│   ├── Dependencies: express Router, admin.controller.js
│   └── Protected: Yes (requires auth middleware)
├── user.route.js
│   ├── Dependencies: express Router, user.controller.js
│   └── Protected: Yes (requires auth middleware)
├── event.route.js
│   ├── Dependencies: express Router, event.controller.js
│   └── Protected: Yes (requires auth middleware)
├── club.route.js
│   ├── Dependencies: express Router, club.controller.js
│   └── Protected: Yes (requires auth middleware)
├── post.route.js
│   ├── Dependencies: express Router, post.controller.js
│   └── Protected: Yes (requires auth middleware)
├── room.route.js
│   ├── Dependencies: express Router, room.controller.js
│   └── Protected: Yes (requires auth middleware)
└── facility.route.js
    ├── Dependencies: express Router, facility.controller.js
    └── Protected: Yes (requires auth middleware)
```

---

## Controllers Layer

### Request Handlers

```
controllers/
├── auth.controller.js
│   ├── Dependencies: auth.service.js
│   ├── Functions: login()
│   └── Purpose: Handle authentication requests
├── admin.controller.js
│   ├── Dependencies: admin.service.js
│   └── Purpose: Handle admin operations
├── user.controller.js
│   ├── Dependencies: user.service.js
│   └── Purpose: Handle user management
├── event.controller.js
│   ├── Dependencies: event.service.js
│   └── Purpose: Handle event operations
├── club.controller.js
│   ├── Dependencies: club.service.js
│   └── Purpose: Handle club management
├── post.controller.js
│   ├── Dependencies: post.service.js
│   └── Purpose: Handle post operations
├── room.controller.js
│   ├── Dependencies: room.service.js
│   └── Purpose: Handle room booking
└── facility.controller.js
    ├── Dependencies: facility.service.js
    └── Purpose: Handle facility management
```

---

## Services Layer (Business Logic)

### Business Logic Modules

```
services/
├── auth.service.js
│   ├── Dependencies: auth.repository.js, club.service.js, bcryptjs, jsonwebtoken
│   ├── Functions: login(), token generation, role determination
│   └── Cross-service: Uses club.service for manager role detection
├── admin.service.js
│   ├── Dependencies: user.repository.js
│   └── Purpose: Administrative business logic
├── user.service.js
│   ├── Dependencies: user.repository.js
│   └── Purpose: User management business logic
├── event.service.js
│   ├── Dependencies: event.repository.js
│   └── Purpose: Event management business logic
├── club.service.js
│   ├── Dependencies: club.repository.js
│   └── Purpose: Club management business logic
├── post.service.js
│   ├── Dependencies: post.repository.js
│   └── Purpose: Post management business logic
├── room.service.js
│   ├── Dependencies: room.repository.js
│   └── Purpose: Room booking business logic
└── facility.service.js
    ├── Dependencies: facility.repository.js
    └── Purpose: Facility management business logic
```

---

## Repository Layer (Data Access)

### Database Access Modules

```
repositories/
├── auth.repository.js
│   ├── Dependencies: config/db.js
│   ├── Functions: findUserByEmail()
│   └── Tables: users
├── user.repository.js
│   ├── Dependencies: config/db.js
│   └── Tables: users
├── event.repository.js
│   ├── Dependencies: config/db.js
│   └── Tables: events
├── club.repository.js
│   ├── Dependencies: config/db.js
│   └── Tables: clubs
├── post.repository.js
│   ├── Dependencies: config/db.js
│   └── Tables: posts
├── room.repository.js
│   ├── Dependencies: config/db.js
│   └── Tables: rooms
└── facility.repository.js
    ├── Dependencies: config/db.js
    └── Tables: facilities
```

---

## Utilities & Scripts

### Utility Modules

```
utils/
├── log.js
│   └── Purpose: Logging functionality
└── logs.js
    ├── Dependencies: log.js
    └── Purpose: Log management and processing
```

### Database Scripts

```
scripts/
├── createTables.js
│   ├── Dependencies: config/db.js
│   └── Purpose: Database schema creation
└── testingConnection.js
    ├── Dependencies: config/db.js
    └── Purpose: Database connectivity testing
```

---

## Database Layer

### CampusConnect Database (MariaDB || aivencloud)

```
Tables (Inferred):
├── users
│   ├── Used by: auth.repository.js, user.repository.js
│   └── Purpose: User authentication and profile data
├── clubs
│   ├── Used by: club.repository.js
│   └── Purpose: Club information and management
├── events
│   ├── Used by: event.repository.js
│   └── Purpose: Event scheduling and details
├── posts
│   ├── Used by: post.repository.js
│   └── Purpose: User posts and content
├── rooms
│   ├── Used by: room.repository.js
│   └── Purpose: Room booking and availability
└── facilities
    ├── Used by: facility.repository.js
    └── Purpose: Campus facility management
```

---

## Dependency Flow

### Layer Dependencies (Top to Bottom)

1. **Routes** call **Controllers**
2. **Controllers** call **Services**
3. **Services** call **Repositories**
4. **Repositories** use **Database Configuration**
5. **Database Configuration** connects to **MariaDB || aivencloud**

### Cross-Layer Dependencies

-   `auth.service.js` → `club.service.js` (for role determination)
-   `admin.service.js` → `user.repository.js` (direct repository access)
-   `log.js` ← `logs.js` (utility dependency)

### Security Flow

-   All protected routes pass through `auth.middleware.js`
-   JWT tokens validated using `jsonwebtoken`
-   Passwords hashed using `bcryptjs`
-   Input validation through `joi`

---

## Architecture Principles

### Design Patterns Used

-   **Layered Architecture**: Clear separation of concerns
-   **Repository Pattern**: Data access abstraction
-   **Service Layer Pattern**: Business logic encapsulation
-   **Middleware Pattern**: Cross-cutting concerns handling
-   **MVC Pattern**: Model-View-Controller separation

### Benefits

-   **Maintainability**: Each layer has single responsibility
-   **Testability**: Easy to mock dependencies
-   **Scalability**: Easy to add new features
-   **Reusability**: Services can be shared across controllers
-   **Security**: Centralized authentication and validation
