# CampusConnect Backend Class Diagram Documentation

## Modeling Section

This section contains the class diagram from the deliverable and provides documentation explaining the design choices.

### Class Diagram Design Choices

**Inheritance and Entity Modeling**: We chose an inheritance hierarchy with `User` as the base class and `Student` and `Admin` as derived classes because they share common attributes (name, email, credentials) while having distinct roles and capabilities. This promotes code reuse and enforces a clear role-based access pattern. Students have additional attributes like faculty, major, and dormitory status, while Admins have administrative privileges and different operational methods.

**Composition vs Association Relationships**: We implemented composition relationships (using _--) between core entities like `Club _-- Post`and`Club \*-- Event`because posts and events cannot exist independently without their parent club context. A post belongs exclusively to one club, and when a club is deleted, its associated posts should also be removed. Similarly, we used association relationships (using -->) for many-to-many relationships like`Student --> Event` for attendance, where students can attend multiple events and events can have multiple attendees, but both entities can exist independently.

**Service Layer Architecture**: The system implements a clear three-tier architecture with Service classes acting as business logic coordinators, Repository interfaces providing data access abstraction, and entity classes representing the domain model. This separation ensures maintainability, testability, and allows for easy swapping of data persistence technologies. Services like `EventService` and `ClubService` encapsulate complex business rules while repositories handle pure data operations.

**Report System Design**: We created separate report classes (`ClubReport`, `EventReport`, `RoomReport`, `FacilityReport`) rather than a generic report system because each report type has distinct validation rules, approval workflows, and data requirements. This approach provides type safety and allows for specialized reporting logic while maintaining a consistent interface pattern across all report types.

## Diagram Location

The class diagram can be found in [class-diagram.mermaid](class-diagram.mermaid) and can be viewed using any Mermaid-compatible viewer.
