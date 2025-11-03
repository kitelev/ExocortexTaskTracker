# iOS App Setup

## How to Run

This project includes a simple iOS app with SwiftUI.

### Option 1: Xcode Project (Recommended for iOS)

If you have XcodeGen installed:

```bash
# Generate Xcode project
xcodegen generate

# Open in Xcode
open ExocortexTaskTracker.xcodeproj

# Select iOS Simulator and Run (⌘R)
```

### Option 2: Command Line (macOS only)

```bash
# Run the app target
swift run ExocortexTaskTrackerApp
```

Note: This will only work on macOS. For iOS deployment, use Xcode.

## App Structure

```
App/
├── ExocortexTaskTrackerApp.swift    # App entry point
├── ContentView.swift                 # Main view
└── Info.plist                        # iOS app configuration
```

## UI

Currently displays: **"Hello world!!!"**

## Next Steps

- Add more screens
- Integrate TaskTimer functionality
- Create task list view
- Add timer controls
