//
//  ContentView.swift
//  TechTest
//
//  Created by David Figueroa on 26/02/25.

import SwiftUI

struct QRScannerView: View {
    @StateObject var viewModel: QRScannerViewModel
    @State private var scannedCode: String = ""
    @State private var isAuthenticated = false

    init(viewModel: QRScannerViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {

        VStack {
            if isAuthenticated {
                ScannerView { scannedCode in
                    self.scannedCode = scannedCode
                }
                .frame(height: 300)

                Text("Scanned Code: \(scannedCode)")
                    .padding()
            } else {
                Button("Authenticate") {
                }
                .padding()
            }
        }
        .navigationTitle("QR Scanner")
        .onAppear(perform: {
        })
        .padding()
    }
}

