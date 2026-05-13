# Admin Route Sequence Diagrams

All routes in this module are protected by the `verifyRole(['admin'])` middleware.

## POST /rooms

```mermaid
sequenceDiagram
    actor Admin
    participant UI as Admin Dashboard (UI)
    participant Route as Admin Route
    participant AuthMW as Auth Middleware
    participant Ctrl as Room Controller
    participant Svc as Room Service
    participant Repo as Room Repository
    participant DB as Database

    Admin->>UI: Submits new room details
    UI->>Route: POST /rooms (with JWT)
    Route->>AuthMW: verifyRole(['admin'])
    AuthMW-->>Route: Proceed
    Route->>Ctrl: createRoom(req, res)
    Ctrl->>Svc: createRoom(...)
    Svc->>Repo: createRoom(...)
    Repo->>DB: INSERT INTO rooms
    DB-->>Repo: Success
    Repo-->>Svc: Success
    Svc-->>Ctrl: Success
    Ctrl-->>UI: 200 OK (Room created)
    UI-->>Admin: Show success message
```

## POST /facilities

```mermaid
sequenceDiagram
    actor Admin
    participant UI as Admin Dashboard (UI)
    participant Route as Admin Route
    participant AuthMW as Auth Middleware
    participant Ctrl as Facility Controller
    participant Svc as Facility Service
    participant DB as Database
    participant Log as Log Utility

    Admin->>UI: Submits new facility details
    UI->>Route: POST /facilities (with JWT)
    Route->>AuthMW: verifyRole(['admin'])
    AuthMW-->>Route: Proceed
    Route->>Ctrl: createFacility(req, res)
    
    alt Missing required fields
        Ctrl-->>UI: 400 Bad Request
        UI-->>Admin: Show validation error
    else Valid data
        Ctrl->>Svc: createFacility(...)
        Svc->>DB: INSERT INTO facilities
        DB-->>Svc: Success
        Svc-->>Ctrl: Success
        
        Ctrl->>Log: saveLog({ action: 'create', edited_table: 'facilities' })
        Log->>DB: Append to logs
        DB-->>Log: Success
        
        Ctrl-->>UI: 200 OK
        UI-->>Admin: Show success message
    end
```

## POST /users

```mermaid
sequenceDiagram
    actor Admin
    participant UI as Admin Dashboard (UI)
    participant Route as Admin Route
    participant AuthMW as Auth Middleware
    participant Ctrl as User Controller
    participant Svc as User Service
    participant DB as Database
    participant Log as Log Utility

    Admin->>UI: Submits new user details
    UI->>Route: POST /users (with JWT)
    Route->>AuthMW: verifyRole(['admin'])
    AuthMW-->>Route: Proceed
    Route->>Ctrl: createUser(req, res)
    
    alt Missing required fields
        Ctrl-->>UI: 400 Bad Request
    else Valid data
        Ctrl->>Svc: getUserByEmail(email)
        Svc->>DB: SELECT user
        DB-->>Svc: user
        alt User already exists
            Ctrl-->>UI: 409 Conflict
        else User is new
            Ctrl->>Svc: createUser(userData)
            Svc->>DB: INSERT INTO users
            DB-->>Svc: userId
            
            alt role == 'student'
                Ctrl->>Svc: createStudent(studentData)
                Svc->>DB: INSERT INTO students
                DB-->>Svc: Success
            else role == 'admin'
                Ctrl->>Svc: createAdmin(adminData)
                Svc->>DB: INSERT INTO admins
                DB-->>Svc: Success
            end
            
            Ctrl->>Log: saveLog({ action: 'create', edited_table: 'users' })
            Log->>DB: Append to logs
            
            Ctrl-->>UI: 201 Created (userId)
            UI-->>Admin: Show success message
        end
    end
```

## GET /report

```mermaid
sequenceDiagram
    actor Admin
    participant UI as Admin Dashboard (UI)
    participant Route as Admin Route
    participant AuthMW as Auth Middleware
    participant Ctrl as Admin Controller
    participant Svc as Admin Service
    participant DB as Database

    Admin->>UI: Navigates to reports
    UI->>Route: GET /report (with JWT)
    Route->>AuthMW: verifyRole(['admin'])
    AuthMW-->>Route: Proceed
    Route->>Ctrl: getReports(req, res)
    Ctrl->>Svc: getAllReports()
    Svc->>DB: Query reports
    DB-->>Svc: reports list
    Svc-->>Ctrl: reports list
    Ctrl-->>UI: 200 OK (reports)
    UI-->>Admin: Display reports
```

## GET /stats

```mermaid
sequenceDiagram
    actor Admin
    participant UI as Admin Dashboard (UI)
    participant Route as Admin Route
    participant AuthMW as Auth Middleware
    participant Ctrl as Admin Controller
    participant Svc as Admin Service
    participant DB as Database

    Admin->>UI: Views dashboard stats
    UI->>Route: GET /stats (with JWT)
    Route->>AuthMW: verifyRole(['admin'])
    AuthMW-->>Route: Proceed
    Route->>Ctrl: getStats(req, res)
    Ctrl->>Svc: getStats()
    Svc->>DB: Query stats
    DB-->>Svc: stats
    Svc-->>Ctrl: stats
    Ctrl-->>UI: 200 OK (stats)
    UI-->>Admin: Display stats
```

## GET /attendance

```mermaid
sequenceDiagram
    actor Admin
    participant UI as Admin Dashboard (UI)
    participant Route as Admin Route
    participant AuthMW as Auth Middleware
    participant Ctrl as Admin Controller
    participant Svc as Admin Service
    participant DB as Database

    Admin->>UI: Views attendance
    UI->>Route: GET /attendance (with JWT)
    Route->>AuthMW: verifyRole(['admin'])
    AuthMW-->>Route: Proceed
    Route->>Ctrl: getAttendaceOverview(req, res)
    Ctrl->>Svc: getAttendanceOverview()
    Svc->>DB: Query attendance
    DB-->>Svc: attendance data
    Svc-->>Ctrl: attendance data
    Ctrl-->>UI: 200 OK (attendance data)
    UI-->>Admin: Display attendance
```

## GET /approvals/events

```mermaid
sequenceDiagram
    actor Admin
    participant UI as Admin Dashboard (UI)
    participant Route as Admin Route
    participant AuthMW as Auth Middleware
    participant Ctrl as Admin Controller
    participant Svc as Admin Service
    participant DB as Database

    Admin->>UI: Navigates to pending events
    UI->>Route: GET /approvals/events (with JWT)
    Route->>AuthMW: verifyRole(['admin'])
    AuthMW-->>Route: Proceed
    Route->>Ctrl: listPendingEvents(req, res)
    Ctrl->>Svc: getPendingEvents()
    Svc->>DB: Query pending events
    DB-->>Svc: events
    Svc-->>Ctrl: events
    Ctrl-->>UI: 200 OK (events)
    UI-->>Admin: Display pending events
```

## PATCH /approvals/events/:id

```mermaid
sequenceDiagram
    actor Admin
    participant UI as Admin Dashboard (UI)
    participant Route as Admin Route
    participant AuthMW as Auth Middleware
    participant Ctrl as Admin Controller
    participant EventSvc as Event Service
    participant AdminSvc as Admin Service
    participant DB as Database
    participant Log as Log Utility

    Admin->>UI: Approves or rejects event
    UI->>Route: PATCH /approvals/events/:id { status, room_id }
    Route->>AuthMW: verifyRole(['admin'])
    AuthMW-->>Route: Proceed
    Route->>Ctrl: approveEvent(req, res)
    
    alt Status is approved but no room_id
        Ctrl-->>UI: 404 Not Found (Missing room)
    else Room provided or rejecting
        Ctrl->>EventSvc: getEventById(eventId)
        EventSvc->>DB: Query event
        DB-->>EventSvc: event
        alt Event does not exist
            Ctrl-->>UI: 404 Not Found
        else Event exists
            Ctrl->>AdminSvc: approveEvent(eventId, status, room_id)
            AdminSvc->>DB: UPDATE event status and room_id
            DB-->>AdminSvc: Success
            
            Ctrl->>Log: saveLog({ action: status, edited_table: 'events' })
            Log->>DB: Insert log entry
            
            Ctrl-->>UI: 200 OK
            UI-->>Admin: Show success message
        end
    end
```

## GET /logs

```mermaid
sequenceDiagram
    actor Admin
    participant UI as Admin Dashboard (UI)
    participant Route as Admin Route
    participant AuthMW as Auth Middleware
    participant Ctrl as Admin Controller
    participant FS as File System

    Admin->>UI: Views system logs
    UI->>Route: GET /logs (with JWT)
    Route->>AuthMW: verifyRole(['admin'])
    AuthMW-->>Route: Proceed
    Route->>Ctrl: getLogs(req, res)
    Ctrl->>FS: fs.existsSync(LOGS_FILE_PATH)
    
    alt File exists
        FS-->>Ctrl: true
        Ctrl->>FS: fs.promises.readFile(LOGS_FILE_PATH)
        FS-->>Ctrl: JSON content
        Ctrl->>Ctrl: JSON.parse()
        Ctrl-->>UI: 200 OK (logs)
    else File does not exist
        FS-->>Ctrl: false
        Ctrl-->>UI: 200 OK ([])
    end
    UI-->>Admin: Display logs
```