import Foundation
@testable import ExocortexTaskTracker

/// Lightweight test runner compatible with Command Line Tools
@MainActor
final class TaskTimerTests {
    
    private var passedCount = 0
    private var failedCount = 0
    
    func runAll() async throws {
        print("🧪 Running TaskTimer Tests\n")
        let startTime = Date()
        
        await test("Initialization", testInitialization)
        await test("Elapsed Time", testElapsedTime)
        await test("Pause Functionality", testPause)
        await test("Resume Functionality", testResume)
        await test("Formatted Duration", testFormattedDuration)
        await test("Multiple Pause/Resume Cycles", testMultiplePauseResumeCycles)
        
        let duration = Date().timeIntervalSince(startTime)
        
        print("\n" + String(repeating: "=", count: 50))
        if failedCount == 0 {
            print("✅ All \(passedCount) tests passed in \(String(format: "%.2f", duration))s")
        } else {
            print("❌ \(failedCount) test(s) failed, \(passedCount) passed")
            throw TestError.testsFailed
        }
    }
    
    private func test(_ name: String, _ block: () async throws -> Void) async {
        print("▸ Testing \(name)...", terminator: "")
        fflush(stdout)
        do {
            try await block()
            print(" ✓")
            passedCount += 1
        } catch {
            print(" ✗")
            print("  Error: \(error)")
            failedCount += 1
        }
    }
    
    private func testInitialization() throws {
        let taskId = "test-task-123"
        let timer = TaskTimer(taskId: taskId)
        
        try expect(timer.taskId == taskId, "Task ID mismatch")
        try expect(!timer.isPaused, "Timer should not be paused initially")
    }
    
    private func testElapsedTime() async throws {
        let timer = TaskTimer(taskId: "test")
        
        try await Task.sleep(nanoseconds: 150_000_000)
        
        let elapsed = timer.elapsedTime
        try expect(elapsed >= 0.14 && elapsed < 0.25, 
                   "Elapsed time: \(elapsed)s, expected ~0.15s")
    }
    
    private func testPause() async throws {
        let timer = TaskTimer(taskId: "test")
        
        try await Task.sleep(nanoseconds: 100_000_000)
        timer.pause()
        
        try expect(timer.isPaused, "Timer should be paused")
        
        let elapsedAtPause = timer.elapsedTime
        try await Task.sleep(nanoseconds: 100_000_000)
        
        let elapsedAfterWait = timer.elapsedTime
        let diff = abs(elapsedAfterWait - elapsedAtPause)
        try expect(diff < 0.01, "Time should not advance while paused")
    }
    
    private func testResume() throws {
        let timer = TaskTimer(taskId: "test")
        
        timer.pause()
        try expect(timer.isPaused, "Timer should be paused")
        
        timer.resume()
        try expect(!timer.isPaused, "Timer should be running")
    }
    
    private func testFormattedDuration() throws {
        let startTime = Date(timeIntervalSinceNow: -3665)
        let timer = TaskTimer(taskId: "test", startTime: startTime)
        
        let formatted = timer.formattedDuration
        try expect(formatted == "01:01:05", 
                   "Formatted duration: \(formatted), expected 01:01:05")
    }
    
    private func testMultiplePauseResumeCycles() async throws {
        let timer = TaskTimer(taskId: "test")
        
        try await Task.sleep(nanoseconds: 100_000_000)
        timer.pause()
        
        try await Task.sleep(nanoseconds: 100_000_000)
        timer.resume()
        
        try await Task.sleep(nanoseconds: 100_000_000)
        
        let elapsed = timer.elapsedTime
        try expect(elapsed >= 0.18 && elapsed < 0.35, 
                   "Total elapsed: \(elapsed)s, expected ~0.2s")
    }
    
    private func expect(_ condition: Bool, _ message: String) throws {
        guard condition else {
            throw TestError.assertionFailed(message)
        }
    }
}

enum TestError: Error {
    case assertionFailed(String)
    case testsFailed
}

@main
struct TestRunner {
    static func main() async {
        do {
            try await TaskTimerTests().runAll()
        } catch {
            Foundation.exit(1)
        }
    }
}
