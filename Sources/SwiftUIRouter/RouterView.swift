import SwiftUI

/// A view that renders content based on the current route.
public struct RouterView<R: Route, Content: View>: View {
    @ObservedObject var router: Router<R>
    let content: (R) -> Content

    public init(router: Router<R>, @ViewBuilder content: @escaping (R) -> Content) {
        self.router = router
        self.content = content
    }

    public var body: some View {
        NavigationStack(path: Binding(
            get: { Array(router.stack.dropFirst()) },
            set: { router.stack = [router.stack[0]] + $0 }
        )) {
            if let root = router.stack.first {
                content(root)
                    .navigationDestination(for: R.self) { route in
                        content(route)
                    }
            }
        }
        .sheet(item: $router.presentedSheet) { route in
            content(route)
        }
    }
}
