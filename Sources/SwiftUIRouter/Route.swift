import Foundation

/// Protocol that all route enums must conform to.
public protocol Route: Hashable, Identifiable {
    var path: String { get }
}

public extension Route {
    var id: String { path }
}
