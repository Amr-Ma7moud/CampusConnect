# CampusConnect Frontend Package Structure

## Overview

This document describes the architecture and package organization of the CampusConnect frontend application. The application is built using React 18, TypeScript, Vite, and Tailwind CSS, following a layered architecture pattern.

## Technology Stack

- **Framework**: React 18 with TypeScript
- **Build Tool**: Vite
- **Styling**: Tailwind CSS
- **UI Library**: shadcn/ui components
- **State Management**: React Context API
- **Routing**: React Router

## Directory Structure

```
CampusConnect Frontend
├── src/
│   ├── App.tsx                     # Main application component
│   ├── main.tsx                   # Application entry point
│   │
│   ├── pages/                     # Application routes/pages
│   │   ├── Dashboard.tsx          # Main dashboard page
│   │   ├── Login.tsx             # Authentication page
│   │   ├── Students.tsx          # Student management
│   │   ├── Events.tsx            # Campus events
│   │   ├── Clubs.tsx             # Student clubs
│   │   ├── Facilities.tsx        # Facility booking
│   │   ├── Sessions.tsx          # Academic sessions
│   │   ├── Reports.tsx           # Analytics & reports
│   │   ├── Settings.tsx          # App settings
│   │   ├── Notifications.tsx     # System notifications
│   │   ├── NotFound.tsx          # 404 error page
│   │   └── Index.tsx             # Landing/home page
│   │
│   ├── components/               # Reusable components
│   │   ├── layout/              # Application layout
│   │   │   ├── AdminLayout.tsx   # Main layout wrapper
│   │   │   ├── AdminSidebar.tsx  # Navigation sidebar
│   │   │   └── TopBar.tsx        # Header component
│   │   │
│   │   ├── ui/                  # Base UI components (shadcn/ui)
│   │   │   ├── button.tsx        # Button component
│   │   │   ├── card.tsx          # Card container
│   │   │   ├── table.tsx         # Data table
│   │   │   ├── form.tsx          # Form components
│   │   │   ├── input.tsx         # Input fields
│   │   │   ├── select.tsx        # Dropdown selects
│   │   │   ├── dialog.tsx        # Modal dialogs
│   │   │   ├── badge.tsx         # Status badges
│   │   │   ├── avatar.tsx        # User avatars
│   │   │   ├── alert.tsx         # Alert messages
│   │   │   ├── checkbox.tsx      # Checkboxes
│   │   │   ├── radio-group.tsx   # Radio buttons
│   │   │   ├── textarea.tsx      # Text areas
│   │   │   ├── tabs.tsx          # Tab navigation
│   │   │   ├── accordion.tsx     # Collapsible content
│   │   │   ├── calendar.tsx      # Date picker
│   │   │   ├── toast.tsx         # Toast notifications
│   │   │   ├── progress.tsx      # Progress bars
│   │   │   ├── skeleton.tsx      # Loading placeholders
│   │   │   ├── tooltip.tsx       # Tooltips
│   │   │   ├── popover.tsx       # Popovers
│   │   │   ├── dropdown-menu.tsx # Context menus
│   │   │   ├── navigation-menu.tsx # Navigation
│   │   │   ├── breadcrumb.tsx    # Breadcrumbs
│   │   │   ├── separator.tsx     # Dividers
│   │   │   ├── sheet.tsx         # Side panels
│   │   │   ├── drawer.tsx        # Slide-out panels
│   │   │   ├── command.tsx       # Command palette
│   │   │   ├── hover-card.tsx    # Hover cards
│   │   │   ├── menubar.tsx       # Menu bars
│   │   │   ├── context-menu.tsx  # Right-click menus
│   │   │   ├── sidebar.tsx       # Collapsible sidebars
│   │   │   ├── switch.tsx        # Toggle switches
│   │   │   ├── slider.tsx        # Range sliders
│   │   │   ├── toggle.tsx        # Toggle buttons
│   │   │   ├── toggle-group.tsx  # Toggle groups
│   │   │   ├── scroll-area.tsx   # Scrollable areas
│   │   │   ├── resizable.tsx     # Resizable panels
│   │   │   ├── aspect-ratio.tsx  # Aspect ratio containers
│   │   │   ├── collapsible.tsx   # Collapsible sections
│   │   │   ├── label.tsx         # Form labels
│   │   │   ├── pagination.tsx    # Page navigation
│   │   │   ├── chart.tsx         # Charts and graphs
│   │   │   ├── carousel.tsx      # Image carousels
│   │   │   ├── sonner.tsx        # Sonner toast
│   │   │   ├── toaster.tsx       # Toast container
│   │   │   ├── use-toast.ts      # Toast hook
│   │   │   └── input-otp.tsx     # OTP inputs
│   │   │
│   │   ├── common/              # App-specific shared components
│   │   │   └── [future components]
│   │   │
│   │   └── NavLink.tsx          # Custom navigation link
│   │
│   ├── contexts/                # Global state management
│   │   ├── AuthContext.tsx      # Authentication state
│   │   └── ThemeContext.tsx     # Theme management
│   │
│   ├── hooks/                   # Custom React hooks
│   │   ├── useTranslation.ts    # Internationalization
│   │   ├── useToast.ts          # Toast notifications
│   │   └── use-mobile.tsx       # Mobile detection
│   │
│   └── lib/                     # Utilities and configurations
│       ├── utils.ts             # Common utility functions
│       └── translations.ts      # i18n resources
│
├── public/                      # Static assets
├── package.json                 # Dependencies and scripts
├── tailwind.config.ts          # Tailwind configuration
├── tsconfig.json               # TypeScript configuration
├── vite.config.ts              # Vite configuration
└── components.json             # shadcn/ui configuration
```

## Package Details

### 1. Entry Points (`/`)
- **App.tsx**: Main application component handling routing and global providers
- **main.tsx**: Application bootstrap and DOM rendering

### 2. Pages Layer (`/pages`)
Main application routes and views:

| Component | Description | Responsibility |
|-----------|-------------|----------------|
| `Dashboard.tsx` | Main dashboard | Statistics overview and quick actions |
| `Login.tsx` | Authentication | User login and session management |
| `Students.tsx` | Student management | CRUD operations for student data |
| `Events.tsx` | Event management | Campus events creation and scheduling |
| `Clubs.tsx` | Club management | Student organizations and clubs |
| `Facilities.tsx` | Facility booking | Campus facility reservation system |
| `Sessions.tsx` | Session management | Academic session scheduling |
| `Reports.tsx` | Analytics | Data reports and system analytics |
| `Settings.tsx` | Configuration | Application settings and preferences |
| `Notifications.tsx` | Alerts | System notifications and messages |
| `NotFound.tsx` | 404 handler | Error page for invalid routes |
| `Index.tsx` | Landing page | Application home/welcome page |

### 3. Layout Components (`/components/layout`)
Application structure and navigation:

| Component | Description | Purpose |
|-----------|-------------|---------|
| `AdminLayout.tsx` | Main layout wrapper | Provides consistent page structure |
| `AdminSidebar.tsx` | Navigation sidebar | Main navigation menu and user actions |
| `TopBar.tsx` | Header component | Application header with branding and user menu |

### 4. UI Components (`/components/ui`)
Base reusable components from shadcn/ui library:

#### Form & Input Components
- `button.tsx` - Interactive buttons with variants
- `input.tsx` - Text input fields
- `textarea.tsx` - Multi-line text input
- `select.tsx` - Dropdown selection menus
- `checkbox.tsx` - Checkbox inputs
- `radio-group.tsx` - Radio button groups
- `form.tsx` - Form wrapper and validation
- `label.tsx` - Form field labels

#### Layout & Structure
- `card.tsx` - Content containers and panels
- `table.tsx` - Data tables with sorting
- `tabs.tsx` - Tabbed content organization
- `accordion.tsx` - Collapsible content sections
- `separator.tsx` - Visual content separators
- `aspect-ratio.tsx` - Responsive aspect ratio containers

#### Feedback & Interaction
- `dialog.tsx` - Modal dialogs and overlays
- `alert-dialog.tsx` - Confirmation dialogs
- `alert.tsx` - Status alerts and messages
- `toast.tsx` & `toaster.tsx` - Toast notifications
- `progress.tsx` - Progress indicators
- `skeleton.tsx` - Loading placeholders

#### Navigation & Menus
- `dropdown-menu.tsx` - Contextual menus
- `navigation-menu.tsx` - Main navigation
- `context-menu.tsx` - Right-click menus
- `menubar.tsx` - Menu bar component
- `breadcrumb.tsx` - Breadcrumb navigation

#### Data Display
- `badge.tsx` - Status and category badges
- `avatar.tsx` - User profile images
- `chart.tsx` - Data visualization charts
- `calendar.tsx` - Date picker and calendar

#### Advanced Components
- `command.tsx` - Command palette
- `popover.tsx` - Floating content
- `hover-card.tsx` - Hover information cards
- `tooltip.tsx` - Contextual tooltips
- `drawer.tsx` - Side panels
- `sheet.tsx` - Overlay panels
- `sidebar.tsx` - Collapsible sidebars

### 5. Common Components (`/components`)
Application-specific shared components:

| Component | Description | Usage |
|-----------|-------------|-------|
| `NavLink.tsx` | Custom navigation link | Enhanced Link component with active states |

### 6. Context Providers (`/contexts`)
Global state management:

| Context | Description | Provides |
|---------|-------------|----------|
| `AuthContext.tsx` | Authentication state | User session, login/logout functions, auth status |
| `ThemeContext.tsx` | Theme management | Theme switching, dark/light mode preferences |

### 7. Custom Hooks (`/hooks`)
Reusable React logic:

| Hook | Description | Purpose |
|------|-------------|---------|
| `useTranslation.ts` | Internationalization | Language switching and text translations |
| `useToast.ts` | Toast notifications | Toast message management and display |
| `use-mobile.tsx` | Device detection | Mobile/desktop responsive behavior |

### 8. Utilities (`/lib`)
Helper functions and configurations:

| File | Description | Contains |
|------|-------------|----------|
| `utils.ts` | Common utilities | Helper functions, formatters, validators |
| `translations.ts` | i18n resources | Translation keys and locale data |

## Architecture Patterns

### Layered Architecture
```
┌─────────────────────────────────────┐
│              Users                  │
└─────────────────┬───────────────────┘
                  │
┌─────────────────▼───────────────────┐
│           Pages Layer               │ ← Route components
└─────────────────┬───────────────────┘
                  │
┌─────────────────▼───────────────────┐
│         Layout Layer                │ ← Structure components
└─────────────────┬───────────────────┘
                  │
┌─────────────────▼───────────────────┐
│       Feature Components            │ ← Business logic
└─────────────────┬───────────────────┘
                  │
┌─────────────────▼───────────────────┐
│         UI Components               │ ← Reusable elements
└─────────────────┬───────────────────┘
                  │
┌─────────────────▼───────────────────┐
│      State & Utilities              │ ← Contexts, hooks, utils
└─────────────────────────────────────┘
```

### Component Dependencies

#### Pages Dependencies
- ✅ Layout Components (AdminLayout, AdminSidebar, TopBar)
- ✅ UI Components (Button, Card, Table, Form, etc.)
- ✅ Context Providers (AuthContext, ThemeContext)
- ✅ Custom Hooks (useTranslation, useToast, useMobile)
- ✅ Utilities (utils, translations)

#### Layout Dependencies
- ✅ UI Components (Button, Avatar, Navigation, etc.)
- ✅ Context Providers (AuthContext, ThemeContext)
- ✅ Custom Hooks (useTranslation, useMobile)
- ✅ Utilities (utils, translations)

#### Custom Hooks Dependencies
- ✅ Context Providers (access global state)
- ✅ Utilities (helper functions)

#### Context Providers
- ⚠️ **Independent** - No dependencies on other app layers
- 🔄 May use utilities for data transformation

### Data Flow Patterns

#### Top-Down Data Flow
```
App Component
    ├── Context Providers (AuthContext, ThemeContext)
    ├── Layout Components (AdminLayout)
    │   ├── AdminSidebar
    │   ├── TopBar
    │   └── Page Content
    └── Pages
        ├── UI Components
        └── Custom Hooks
```

#### State Management Flow
```
Context Providers → Custom Hooks → Components → UI Updates
     ↑                                            ↓
     └── User Actions ← Event Handlers ← Components
```

## Development Guidelines

### Component Creation Rules
1. **Pages**: Handle routing and high-level business logic
2. **Layout**: Provide consistent structure across pages
3. **UI Components**: Keep pure and reusable, avoid business logic
4. **Custom Hooks**: Encapsulate reusable stateful logic
5. **Contexts**: Manage global application state only

### Import Organization
```typescript
// External libraries
import React from 'react'
import { useState } from 'react'

// Internal components (absolute imports recommended)
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'

// Contexts and hooks
import { useAuth } from '@/contexts/AuthContext'
import { useTranslation } from '@/hooks/useTranslation'

// Utilities
import { cn } from '@/lib/utils'
```

### File Naming Conventions
- **Components**: PascalCase (`AdminLayout.tsx`, `UserCard.tsx`)
- **Hooks**: camelCase starting with 'use' (`useTranslation.ts`)
- **Utilities**: camelCase (`utils.ts`, `translations.ts`)
- **Pages**: PascalCase (`Dashboard.tsx`, `Login.tsx`)

## API Integration Points

### Backend Communication
All pages that require data fetching communicate with the CampusConnect Backend API:

- **Authentication**: `Login.tsx` → Auth endpoints
- **Dashboard**: `Dashboard.tsx` → Analytics endpoints  
- **Students**: `Students.tsx` → Student management endpoints
- **Events**: `Events.tsx` → Event management endpoints
- **Clubs**: `Clubs.tsx` → Club management endpoints
- **Facilities**: `Facilities.tsx` → Facility booking endpoints
- **Sessions**: `Sessions.tsx` → Session management endpoints
- **Reports**: `Reports.tsx` → Reporting endpoints
- **Notifications**: `Notifications.tsx` → Notification endpoints

### State Synchronization
- **AuthContext** maintains user session state
- **Pages** use custom hooks for API calls
- **Components** receive data via props or context
- **Error handling** through toast notifications

## Performance Considerations

### Code Splitting
- Pages are ideal candidates for lazy loading
- Large UI components can be code-split
- Third-party libraries should be loaded on demand

### State Management
- Keep global state minimal (only auth and theme)
- Use local state for component-specific data
- Leverage React's built-in optimization (memo, useMemo, useCallback)

### Bundle Optimization
- Tree-shake unused UI components
- Optimize imports from shadcn/ui library
- Use dynamic imports for heavy features

This architecture provides a scalable, maintainable structure for the CampusConnect frontend application while following React and TypeScript best practices.