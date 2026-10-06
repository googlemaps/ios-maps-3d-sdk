// swift-tools-version: 5.7
//
// Copyright 2024 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "GoogleMaps3D", platforms: [.iOS(.v16)],
  products: [
    .library(name: "GoogleMaps3D", targets: ["GoogleMaps3DTarget"]),
    .library(name: "GoogleMaps3DKit", targets: ["GoogleMaps3DKitTarget"]),
  ],
  dependencies: [
    .package(url: "https://github.com/googlemaps/ios-places-sdk", "11.2.0"..<"12.0.0")
  ],
  targets: [
    .binaryTarget(
      name: "GoogleMaps3D",
      url: "https://dl.google.com/geosdk/swiftpm/1.0.0/google_maps3d.xcframework.zip",
      checksum: "b25a780bcf843ce4e0d0a57b0525b64d66269efeeb08c3987adf53664dd76829"
    ),
    .target(
      name: "GoogleMaps3DTarget",
      dependencies: ["GoogleMaps3D"],
      path: "Maps3D",
      sources: ["Empty.swift"],
      resources: [.copy("Resources/GoogleMaps3DResources/GoogleMaps3D.bundle")],
      publicHeadersPath: "Sources",
      linkerSettings: [
        .linkedLibrary("sqlite3"),
        .linkedLibrary("c++"),
      ]
    ),
    .binaryTarget(
      name: "GoogleMaps3DKit",
      url: "https://dl.google.com/geosdk/swiftpm/1.0.0/google_maps3d_kit.xcframework.zip",
      checksum: "495ae2310ed834340e5c66d50f51140e8328bcc258ad24f07edc98b52c15c5e0"
    ),
    .target(
      name: "GoogleMaps3DKitTarget",
      dependencies: [
        "GoogleMaps3DKit",
        "GoogleMaps3DTarget",
        .product(name: "GooglePlacesSwift", package: "ios-places-sdk"),
      ],
      path: "Maps3DKit",
      sources: ["Empty.swift"],
      publicHeadersPath: "Sources",
      linkerSettings: [
        .linkedLibrary("sqlite3"),
        .linkedLibrary("c++"),
      ]
    ),
  ]
)
