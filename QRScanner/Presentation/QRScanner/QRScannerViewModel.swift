import Combine

class QRScannerViewModel: ObservableObject {
    @Published var scannedCode: String = ""
    @Published var isAuthenticated = false
}
