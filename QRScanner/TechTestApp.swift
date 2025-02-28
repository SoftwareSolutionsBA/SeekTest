//
//  TechTestApp.swift
//  TechTest
//
//  Created by David Figueroa on 26/02/25.
//

import SwiftUI

@main
struct TechTestApp: App {
    var body: some Scene {
        WindowGroup {
            QRScannerView(viewModel: QRScannerViewModel(getPostsUseCase: GetPostsUseCase()))
        }
    }
}
