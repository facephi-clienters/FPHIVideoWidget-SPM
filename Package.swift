// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "FPHIVideoWidget-SPM",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "FPHIVideoWidget-SPM",
            targets: [
                "FPHIVideoWidget-SPM",
                "FPHIVideoWidget",
            ]
        ),
    ],
    dependencies: [
        .package(url: "git@github.com:facephi-clienters/SDK-FPHIDesignSystemResources-SPM.git", exact: "2.7.3"),
        .package(url: "https://github.com/facephi-clienters/FPHISelphidDocumentReaderBundle-SPM.git", exact: "2.1.2"),
    ],
    targets: [
        .target(
            name: "FPHIVideoWidget-SPM",
            dependencies: [
                "FPHIVideoWidget",
                .product(name: "FPHIDesignSystemResources", package: "SDK-FPHIDesignSystemResources-SPM"),
                .product(name: "FPHISelphidDocumentReaderBundle-SPM", package: "FPHISelphidDocumentReaderBundle-SPM"),
            ],
            path: ".",
            exclude: [
                "FPHIVideoWidget.podspec",
                "FPHIVideoWidget-template.podspec",
                "Package-template.swift",
                "build",
                "scripts",
                "src",
            ],
            sources: ["Sources/FPHIVideoWidget-SPM"],
            resources: [
                .copy("compose/cocoapods/compose-resources"),
                .copy("cocoapods/resources/extractor-resources"),
            ]
        ),
        .binaryTarget(
            name: "FPHIVideoWidget",
            url: "https://facephicorp.jfrog.io/artifactory/spm-pro-fphi/WIDGET/FPHIVideoWidget/0.0.11/FPHIVideoWidget.zip",
            checksum: "80c88d3da49ee68c58a767cb5e3e835541f611cd469517b31dbbc3effd9ce78b"
        ),
    ]
)
