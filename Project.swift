import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let platform: Platform = .iOS
let appName = "PortaCovid"

let mainTarget = Target(
    name: appName,
    platform: platform,
    product: .app,
    bundleId: "${CUSTOM_BUNDLE_ID}",
    infoPlist: "Sources/Info.plist",
    sources: ["Sources/**"],
    resources: ["Resources/**"],
    dependencies: [
        .package(product: "EUDCC"),
        .package(product: "EUDCCDecoder")
    ],
    settings: Settings.settings(configurations: [
        .debug(
            name: "Debug",
            settings: ["CODE_SIGN_IDENTITY": "$(CODE_SIGN_IDENTITY)",
                       "TARGETED_DEVICE_FAMILY": "1"],
            xcconfig: "Configs/Debug.xcconfig"
        ),
        .release(
            name: "Release",
            settings: ["CODE_SIGN_IDENTITY": "$(CODE_SIGN_IDENTITY)",
                       "TARGETED_DEVICE_FAMILY": "1"],
            xcconfig: "Configs/Release.xcconfig"
        )
    ])
)

let testTarget = Target(
    name: "Tests",
    platform: platform,
    product: .unitTests,
    bundleId: "${CUSTOM_BUNDLE_ID}.Tests",
    infoPlist: .default,
    sources: ["Tests/**"],
    dependencies: [
        .target(name: appName),
        .xctest
    ]
)

let uiTestTarget = Target(
    name: "UITests",
    platform: platform,
    product: .uiTests,
    bundleId: "${CUSTOM_BUNDLE_ID}.UITests",
    infoPlist: .default,
    sources: ["UITests/**", "fastlane/SnapshotHelper.swift"],
    dependencies: [
        .xctest,
        .target(name: "PortaCovid")
    ]
)

let scheme = Scheme(
    name: appName,
    shared: true,
    buildAction: BuildAction(targets: [TargetReference(stringLiteral: appName)]),
    testAction: TestAction.targets([TestableTarget("Tests")],
                                   options: .options(language: "en", region: "US", coverage: true))
)

let uiTestScheme = Scheme(
    name: "UITests",
    shared: true,
    buildAction: BuildAction(
        targets: [
            TargetReference(stringLiteral: appName),
            TargetReference(stringLiteral: "UITests")
        ]
    ),
    testAction: TestAction.targets([TestableTarget("UITests")],
                                   options: .options(coverage: false))
)

let project = Project(name: appName,
                      packages: [
                        .remote(url: "https://github.com/SvenTiigi/EUDCCKit.git", requirement: .upToNextMajor(from: "0.0.3"))
                      ],
                      targets: [mainTarget, testTarget, uiTestTarget],
                      schemes: [scheme, uiTestScheme],
                      additionalFiles: ["Configs/Base.xcconfig"])

// MARK: Helper

func getCarthageDependency(name: String) -> TargetDependency {
    .xcframework(path: "./Carthage/Build/\(name).xcframework")
}
