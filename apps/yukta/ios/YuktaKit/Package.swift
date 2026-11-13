// swift-tools-version: 5.9
import PackageDescription

/// Yukta's domain engine: weight trend, expenditure estimate, targets, guardrails and
/// levers (docs/yukta/engineering/energy-spec.md), and the v1.1 recovery score
/// (recovery-spec.md). Every number the app shows is computed here.
///
/// It has **no dependencies** (not SwiftUI, not HealthKit), so `swift test` runs in
/// seconds on a Mac or a Linux CI container, and the app can't sneak a formula or
/// a guardrail past the spec.
let package = Package(
    name: "YuktaKit",
    // macOS is listed so `swift test` runs on the Mac rather than needing a simulator.
    platforms: [.iOS(.v17), .macOS(.v13)],
    products: [
        .library(name: "YuktaKit", targets: ["YuktaKit"]),
    ],
    targets: [
        .target(name: "YuktaKit"),
        .testTarget(name: "YuktaKitTests", dependencies: ["YuktaKit"]),
    ]
)
