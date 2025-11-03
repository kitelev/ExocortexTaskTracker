import Foundation

/// Simple task timer for tracking task duration
public final class TaskTimer {
    
    // MARK: - Properties
    
    public let taskId: String
    private let startTime: Date
    private var pausedAt: Date?
    private var accumulatedDuration: TimeInterval = 0
    private var lastResumeTime: Date
    
    // MARK: - Initialization
    
    public init(taskId: String, startTime: Date = Date()) {
        self.taskId = taskId
        self.startTime = startTime
        self.lastResumeTime = startTime
    }
    
    // MARK: - Public Methods
    
    /// Get current elapsed time in seconds
    public var elapsedTime: TimeInterval {
        if pausedAt != nil {
            // Timer is paused, return accumulated time only
            return accumulatedDuration
        }
        // Timer is running, add current interval to accumulated
        return accumulatedDuration + Date().timeIntervalSince(lastResumeTime)
    }
    
    /// Pause the timer
    public func pause() {
        guard pausedAt == nil else { return }
        let now = Date()
        pausedAt = now
        accumulatedDuration += now.timeIntervalSince(lastResumeTime)
    }
    
    /// Resume the timer
    public func resume() {
        guard pausedAt != nil else { return }
        pausedAt = nil
        lastResumeTime = Date()
    }
    
    /// Check if timer is paused
    public var isPaused: Bool {
        pausedAt != nil
    }
    
    /// Get formatted duration string (HH:mm:ss)
    public var formattedDuration: String {
        let duration = Int(elapsedTime)
        let hours = duration / 3600
        let minutes = (duration % 3600) / 60
        let seconds = duration % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
