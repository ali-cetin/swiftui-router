import SwiftUI
import Combine

/// Observable router that manages navigation state.
@MainActor
public final class Router<R: Route>: ObservableObject {
    @Published public var stack: [R] = []
    @Published public var presentedSheet: R?

    public init(root: R? = nil) {
        if let root { stack = [root] }
    }

    /// Push a route onto the navigation stack.
    public func push(_ route: R) {
        stack.append(route)
    }

    /// Pop the top route from the stack.
    @discardableResult
    public func pop() -> R? {
        guard stack.count > 1 else { return nil }
        return stack.removeLast()
    }

    /// Pop to the root route.
    public func popToRoot() {
        guard stack.count > 1 else { return }
        stack = [stack[0]]
    }

    /// Present a route as a sheet.
    public func present(_ route: R) {
        presentedSheet = route
    }

    /// Dismiss the presented sheet.
    public func dismiss() {
        presentedSheet = nil
    }

    /// Replace the entire stack.
    public func reset(to routes: [R]) {
        stack = routes
    }

    /// The current top route.
    public var current: R? {
        stack.last
    }

    /// Number of routes in the stack.
    public var depth: Int {
        stack.count
    }
}
