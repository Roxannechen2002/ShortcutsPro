# ShortcutsPro

ShortcutsPro is an iOS application designed to help users manage and organize their iOS Shortcuts.

---

## Features

- **Categorized management of shortcuts**  
- **Favorites functionality**  
- **Detailed shortcut information view**  
- **Quick import of shortcuts**  
- **Local data storage using SwiftData**

---

## Technical Architecture

- **SwiftUI**: Used to build the user interface.  
- **SwiftData**: Utilized for persistent data storage.  
- **iOS 17+**: Leverages the latest iOS features.

---

## Key Components

### Models

1. **Shortcut**  
   - Core data model for shortcuts.  
   - Includes properties such as name, description, category, and favorite status.  
   - Managed using SwiftData.  

2. **ShortcutCategory**  
   - Enumeration for shortcut categories.  
   - Categories include: AI Tools, Productivity, Life Hack, and Well Being.  
   - Each category is associated with a specific icon.

3. **ShortcutTemplate**  
   - Template structure for shortcuts.  
   - Includes the category, name, and iCloud link.

---

### Views

1. **ContentView**  
   - The main view of the application.  
   - Handles overall navigation and layout.

2. **ShortcutDetailView**  
   - Displays detailed information about a shortcut.  
   - Includes name, description, category, and favorite status.

3. **CategoryButton**  
   - A custom component for category buttons.  
   - Supports selected state display.  
   - Includes an icon and text label.

---

## Current Progress

- [x] Basic data model design completed.  
- [x] Integrated SwiftData.  
- [x] Implemented the category system.  
- [x] Developed basic UI components.  
- [ ] Shortcut import functionality.  
- [ ] User data persistence.  
- [ ] UI optimization and testing.

---

## To-Do List

1. Finalize the implementation of `ContentView`.  
2. Add error handling for the shortcut import functionality.  
3. Implement a search feature for shortcuts.  
4. Add a user settings page.  
5. Optimize UI/UX design.  
6. Add unit tests.

---

## System Requirements

- **iOS 17.0 or later**  
- **Xcode 15.0 or later**

---

## Installation Instructions

1. Clone the project repository.  
2. Open the project in Xcode.  
3. Select a target device or simulator.  
4. Build and run the project.

---

## Contribution Guidelines

Contributions are welcome via Pull Requests. Before submitting, please ensure:  

1. Your code adheres to the project’s coding standards.  
2. Appropriate comments and documentation are included.  
3. All existing tests pass successfully.

---

## License

This project is licensed under the **MIT License**. See the LICENSE file for details.
