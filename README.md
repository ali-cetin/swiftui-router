# 🍎 swiftui-router

A type-safe, declarative navigation router for SwiftUI with deep linking, state restoration, and tab coordination.

[![Swift](https://img.shields.io/badge/Swift-5.9+-FA7343.svg)](https://swift.org)
[![Platforms](https://img.shields.io/badge/Platforms-iOS%2017+%20|%20macOS%2014+-blue.svg)](https://apple.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

## Features

- 🧭 **Type-safe routes** — Compile-time checked navigation paths
- 🔗 **Deep linking** — URL scheme and Universal Links support
- 💾 **State restoration** — Automatic navigation state persistence
- 📱 **Tab coordination** — Seamless multi-tab navigation management
- 🧪 **Testable** — Protocol-based design for easy unit testing

## Quick Start

```swift
// Package.swift
.package(url: "https://github.com/ali-cetin/swiftui-router.git", from: "1.0.0")
```

```swift
import SwiftUIRouter

// Define routes
enum AppRoute: Route {
    case home
    case profile(userId: String)
    case settings
    case detail(itemId: Int)

    var path: String {
        switch self {
        case .home: return "/"
        case .profile(let id): return "/profile/\(id)"
        case .settings: return "/settings"
        case .detail(let id): return "/items/\(id)"
        }
    }
}

// Use in your app
struct ContentView: View {
    @StateObject var router = Router<AppRoute>()

    var body: some View {
        RouterView(router: router) { route in
            switch route {
            case .home:
                HomeView()
            case .profile(let userId):
                ProfileView(userId: userId)
            case .settings:
                SettingsView()
            case .detail(let itemId):
                DetailView(itemId: itemId)
            }
        }
    }
}

// Navigate programmatically
struct HomeView: View {
    @EnvironmentObject var router: Router<AppRoute>

    var body: some View {
        List {
            Button("View Profile") {
                router.push(.profile(userId: "user123"))
            }
            Button("Settings") {
                router.push(.settings)
            }
        }
    }
}
```

## License

MIT License
