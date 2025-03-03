//
//  ContentView.swift
//  TechTest
//
//  Created by David Figueroa on 26/02/25.

import SwiftUI

struct QRScannerView: View {
    @StateObject var viewModel: QRScannerViewModel
    
    init(viewModel: QRScannerViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {

        VStack {
            NavigationStack {
                Image(systemName: viewModel.isAuthenticated ? "lock.open.fill" : "lock.square")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)

                if viewModel.isAuthenticated {
                    Text("Latest Scanned Code: \(viewModel.latestScannedCode)")
                        .padding()

                    Text("Scanned Code: \(viewModel.scannedCode)")
                        .padding()

                    HStack {
                        Spacer()
                        ScannerView { scannedCode in
                            viewModel.scannedCode = scannedCode
                        }
                        Spacer()
                    }
                } else {
                    NavigationLink {
                        FlutterViewControllerRepresentable(isAuthenticated: $viewModel.isAuthenticated)
                    } label: {
                        Text("Authenticate")
                            .bold()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    .controlSize(.large)
                    .padding(.vertical, 10)
                }
            }
        }
        .navigationTitle("QR Scanner")
        .onAppear(perform: {
        })
        .padding()
    }
}

