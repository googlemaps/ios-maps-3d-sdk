// swift-tools-version: 5.9
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
  name: "GoogleMaps3D", platforms: [.iOS(.v17)],
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
      url: "https://dl.google.com/geosdk/swiftpm/1.1.0/google_maps3d.xcframework.zip",
      checksum: "76ae64ede078512a57bf74bc9b6db6bc45c992fe92ae58102acb84ceb1b0433d"
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
      url: "https://dl.google.com/geosdk/swiftpm/1.1.0/google_maps3d_kit.xcframework.zip",
      checksum: "42ccb535a7ea8f7ccaebd5b0caeed1c4705d44a1d5be3d9e0fc131ce330f2796"
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
