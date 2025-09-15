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
  products: [.library(name: "GoogleMaps3D", targets: ["GoogleMaps3DTarget"])], dependencies: [],
  targets: [
    .binaryTarget(
      name: "GoogleMaps3D",
      url: "https://dl.google.com/geosdk/maps3d/0.0.2/GoogleMaps3d_3p.xcframework.zip",
      checksum: "75f236755b3cc19e182003d20d5de36977f97dfac33fe8379754f7692242c32b"
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
  ]
)
