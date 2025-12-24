# CampusConnect 🎓

**A Comprehensive Campus Management System for E-JUST University**

CampusConnect is a multi-platform campus management system designed to streamline interactions between students, club managers, and system administrators at E-JUST University. The system provides seamless facility booking, event management, and club engagement through dedicated Android and web applications.

## 🚀 Project Overview

CampusConnect serves as a central hub for campus activities, enabling:

-   **Students** to reserve facilities, join events, and engage with clubs
-   **Club Managers** to organize events, manage members, and communicate with followers
-   **System Admins** to oversee operations, approve events, and monitor system health

## 🏗️ System Architecture

### Platform Distribution

| Platform       | Target Users             | Primary Functions                                                 |
| -------------- | ------------------------ | ----------------------------------------------------------------- |
| **📱 Android** | Students & Club Managers | Mobile-first experience for bookings, events, and club management |
| **🌐 Web**     | System Admins            | Comprehensive dashboard for system oversight and administration   |

### Repository Structure

```
CampusConnect/
├── 📱 Android-app/          # Android application for students & club managers
├── 🖥️  Back-end/            # Node.js backend API server
├── 🌐 Front-end/           # React web application for system admins
├── 📋 documentation/       # System documentation and diagrams
└── 🎨 Design/             # UI/UX design assets
```

## 👥 User Roles & Capabilities

### 🎓 Students

**Core Functions:**

-   **📚 Study Room Management**
    -   Reserve private study rooms
    -   Check-in/check-out of public study rooms
    -   Cancel reservations
-   **🏃‍♂️ Sports Facility Booking**
    -   Reserve gym time slots
    -   Join sports activities (with min/max capacity requirements)
    -   Cancel sport reservations
-   **🎉 Event Participation**
    -   View and register for events
    -   Check-in to attended events
    -   Cancel event registrations
-   **👥 Club Engagement**
    -   Join clubs of interest
    -   Attend club sessions
    -   Receive club announcements
-   **🔔 Notifications**
    -   Event reminders
    -   Reservation confirmations
    -   Club updates and announcements
-   **🛠️ Reporting**
    -   Report facility issues
    -   Provide feedback

### 🏛️ Club Managers

**Event & Session Management:**

-   Create and manage club events (requires admin approval)
-   Organize club sessions for members only
-   Cancel events and sessions when needed
-   View attendee lists and registration data

**Communication Tools:**

-   Publish event announcements
-   Send session updates
-   Create posts for club followers
-   Optional social media integration

**Club Administration:**

-   Manage club information and profile
-   Track member engagement
-   Monitor club statistics

### ⚙️ System Administrators

**User & Content Management:**

-   Create and manage student accounts
-   Establish and oversee clubs
-   Manage administrative accounts
-   Add faculty information

**Event Oversight:**

-   Approve/decline event requests
-   Create university-wide events
-   Override system decisions when needed

**System Monitoring:**

-   Generate comprehensive reports
-   Monitor facility usage logs
-   Track system performance
-   Handle student complaints

**Facility Management:**

-   Monitor facility availability
-   Manage booking conflicts
-   Track maintenance issues

## 🌟 Core Features

### 🔐 Authentication & Authorization

-   Multi-role authentication system
-   Secure session management
-   Role-based access control

### 📅 Event Management

-   **Event Creation**: Club managers propose events for admin approval
-   **Event Registration**: Students can reserve spots for approved events
-   **Event Analytics**: Track attendance and engagement metrics

### 🏢 Facility Booking System

-   **Study Rooms**: Public (check-in/out) and Private (reservation-based)
-   **Sports Facilities**: Gym slots and team sports with capacity management
-   **Smart Release**: Automatic facility release after no-show (20-minute grace period)

### 🔔 Notification System

-   Real-time push notifications (Android)
-   Email notifications
-   Pre-event reminders
-   Club announcements

### 📊 Administrative Dashboard

-   System health monitoring
-   Usage analytics and reports
-   User management interface
-   Complaint handling system

## 📱 Platform Details

### Android Application

**Target Audience**: Students & Club Managers

-   **Native Android**: Built with Kotlin/Java
-   **Offline Capability**: Key features work without internet
-   **Push Notifications**: Real-time updates and reminders
-   **Modern UI**: Material Design principles

### Web Application

**Target Audience**: System Administrators

-   **React Frontend**: Modern, responsive web interface
-   **Admin Dashboard**: Comprehensive system overview
-   **Real-time Analytics**: Live system metrics and reports
-   **Multi-tab Workflow**: Efficient administrative operations

## 🔗 API Documentation

**Live API Documentation**: [https://0x3s2j5jed.apidog.io/](https://0x3s2j5jed.apidog.io/)

### Current API Status

✅ **Implemented**:

-   Authentication endpoints
-   User management
-   Event CRUD operations
-   Facility booking system
-   Basic notifications

🚧 **In Progress**:

-   Pagination implementation
-   Club posts management
-   Session/event retrieval
-   Check-in/out functionality for study rooms and events

📋 **Planned Features**:

-   Image upload for posts
-   Advanced reporting endpoints
-   Real-time notification delivery

## 🛠️ Development Phases

### Phase 1: Software Modeling (Week 1) ✅

**Documentation & Diagrams**:

-   ER Diagrams
-   Class Diagrams
-   Deployment Diagrams
-   Package Diagrams
-   Use Case Diagrams
-   Activity Diagrams (2)
-   Sequence Diagrams (2)
-   State Machine Diagrams (1)

### Phase 2: Design & Documentation (Week 2) ✅

-   **API Documentation** → Backend Team
-   **UI/UX Design** → Design Team

### Phase 3: Implementation (10 Days) 🚧

-   Backend API development
-   Android application
-   Web admin dashboard
-   Database implementation

### Phase 4: Integration & Testing (5 Days) 📋

-   System integration
-   Manual testing
-   Documentation review and updates

## 🏛️ System Workflow Examples

### Event Management Flow

1. **Club Manager** creates event proposal
2. **System Admin** reviews and approves/declines
3. **Students** can register for approved events
4. **System** sends reminders before event
5. **Students** check-in at event venue
6. **Club Manager** views attendance analytics

### Study Room Booking

1. **Student** views available private study rooms
2. **Student** reserves preferred time slot
3. **System** confirms reservation
4. **System** sends reminder before session
5. **Student** checks-in or loses reservation after 20-min grace period

## 📊 System Statistics & Insights

**For Students**: Track personal usage, upcoming events, and club engagement
**For Club Managers**: Monitor event success, member engagement, and club growth  
**For Admins**: Comprehensive system overview, popular facilities, user activity patterns

## 🔧 Technical Stack

### Backend

-   **Runtime**: Node.js
-   **Framework**: Express.js
-   **Database**: Aiven Cloud
-   **Authentication**: JWT tokens

### Android

-   **Language**: Kotlin/Java
-   **Architecture**: MVVM
-   **Notifications**: Firebase Cloud Messaging

### Web Frontend

-   **Framework**: React.js
-   **Build Tool**: Vite
-   **Styling**: Tailwind CSS
-   **State Management**: React Context

## 📋 Known Limitations

-   Posts are currently limited to homepage and club profiles
-   Image upload functionality is planned for future releases
-   Some advanced reporting features are still in development

## 🤝 Contributing

This project is part of the Software Modeling course at E-JUST University.

### Team Structure

-   **Backend Development**: API and database implementation
-   **Android Development**: Mobile application
-   **Frontend Development**: Web admin dashboard
-   **Documentation**: System modeling and technical documentation

## 📞 Support

For technical issues or feature requests, please contact the development team or create an issue in the appropriate repository.

---

**🎯 Mission**: Streamlining campus life through technology, connecting students, clubs, and administration for a more engaged university community.
