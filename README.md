# ExocortexTaskTracker

Simple Swift package for task time tracking with pause/resume functionality + iOS App.

## Overview

This package provides:
- ✅ **TaskTimer class** - Track elapsed time with pause/resume
- ✅ **iOS App** - Simple SwiftUI interface
- ✅ **Testing framework** - Custom test runner
- ✅ **CI/CD** - GitHub Actions with branch protection

## 📱 iOS App

The project now includes a simple iOS app with SwiftUI interface.

### Running the iOS App

**Option 1: Xcode (Recommended)**
```bash
# Generate Xcode project (if not already generated)
xcodegen generate

# Open in Xcode
open ExocortexTaskTracker.xcodeproj

# Select iOS Simulator and Run (⌘R)
```

**Option 2: Command Line (macOS only)**
```bash
swift run ExocortexTaskTrackerApp
```

### Current UI

- **Home Screen**: Displays "Hello world!!!"
- More features coming soon...

See [IOS_APP.md](IOS_APP.md) for details.

## Installation

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/ExocortexTaskTracker", from: "0.1.0")
]
```

## Usage

```swift
import ExocortexTaskTracker

// Create a timer
let timer = TaskTimer(taskId: "task-123")

// Check elapsed time
let elapsed = timer.elapsedTime  // in seconds
let formatted = timer.formattedDuration  // "00:05:23"

// Pause/resume
timer.pause()
timer.resume()

// Check status
if timer.isPaused {
    print("Timer is paused")
}
```

## API Reference

### TaskTimer

```swift
public final class TaskTimer {
    /// Task identifier
    public let taskId: String
    
    /// Current elapsed time in seconds
    public var elapsedTime: TimeInterval { get }
    
    /// Formatted duration string (HH:mm:ss)
    public var formattedDuration: String { get }
    
    /// Whether timer is paused
    public var isPaused: Bool { get }
    
    /// Initialize timer
    public init(taskId: String, startTime: Date = Date())
    
    /// Pause the timer
    public func pause()
    
    /// Resume the timer
    public func resume()
}
```

## Testing

Run tests with:

```bash
# Quick run
swift run ExocortexTaskTrackerTests

# Or use test script (with clean build)
./test.sh
```

### Test Framework

Uses a lightweight custom test runner compatible with Command Line Tools (no Xcode required):
- ✅ Works without XCTest/Xcode
- ✅ Async/await support
- ✅ Clean output with timing
- ✅ Proper error reporting

### Test Coverage

- ✅ Initialization
- ✅ Elapsed time tracking
- ✅ Pause functionality
- ✅ Resume functionality
- ✅ Formatted duration output
- ✅ Multiple pause/resume cycles

**All 6 tests pass in ~0.67s**

## Requirements

- Swift 6.2+
- macOS 14.0+ / iOS 16.0+
- Command Line Tools (Xcode not required)

## Best Practices Applied

This project follows Swift testing best practices:

1. **Executable Test Target** - Works without full Xcode installation
2. **Concurrency-Safe** - Uses `@MainActor` for test state
3. **Fast Execution** - Completes in <1 second
4. **Clear Output** - Visual test progress with ✓/✗
5. **CI-Ready** - Exit codes for automation
6. **Type-Safe** - Full Swift type safety

## License

MIT License

