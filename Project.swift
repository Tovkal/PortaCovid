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
        .debug(name: "Debug", xcconfig: "Configs/Debug.xcconfig"),
        .release(name: "Release", xcconfig: "Configs/Release.xcconfig")
    ])
)

let uiTestTarget = Target(
    name: "UITests",
    platform: platform,
    product: .uiTests,
    bundleId: "${CUSTOM_BUNDLE_ID}",
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
    buildAction: BuildAction(targets: [TargetReference(stringLiteral: appName)])
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
                      targets: [mainTarget, uiTestTarget],
                      schemes: [scheme, uiTestScheme],
                      additionalFiles: ["Configs/Base.xcconfig"])

// MARK: Helper

func getCarthageDependency(name: String) -> TargetDependency {
    .xcframework(path: "./Carthage/Build/\(name).xcframework")
}
