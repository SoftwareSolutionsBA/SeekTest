import SwiftUI
import Flutter
import FlutterPluginRegistrant

@Observable
class FlutterDependencies: ObservableObject {
    let flutterEngine = FlutterEngine(name: "engine")
    init() {
        flutterEngine.run()
        GeneratedPluginRegistrant.register(with: self.flutterEngine);
    }
}

@main
struct TechTestApp: App {
    @State var flutterDependencies = FlutterDependencies()
    
    var body: some Scene {
        WindowGroup {
            QRScannerView(viewModel: QRScannerViewModel())
                .environmentObject(flutterDependencies)
        }
    }
}
