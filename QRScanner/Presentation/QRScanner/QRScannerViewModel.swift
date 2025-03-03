import Combine

class QRScannerViewModel: ObservableObject {
    @Published var scannedCode: String = "" {
        didSet {
            guard !scannedCode.isEmpty else { return }
            let repository = QRMessageRepository()
            repository.saveString(scannedCode)
            latestScannedCode = latestScannedCode
        }
    }
    @Published var isAuthenticated = false

    @Published var latestScannedCode: String = ""

    init(scannedCode: String = "", isAuthenticated: Bool = false, latestScannedCode: String = "") {
        self.scannedCode = scannedCode
        self.isAuthenticated = isAuthenticated
        self.latestScannedCode = latestScannedCode
    }

    func getLatestScannedCode() {
        let repository = QRMessageRepository()
        self.latestScannedCode = repository.getString() ?? ""
    }
}
