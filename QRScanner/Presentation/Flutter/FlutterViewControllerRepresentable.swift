import SwiftUI
import Flutter

struct FlutterViewControllerRepresentable: UIViewControllerRepresentable {
    // Flutter dependencies are passed in through the view environment.
    @Environment(FlutterDependencies.self) var flutterDependencies
    @Binding var isAuthenticated: Bool

    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = FlutterViewController(engine: flutterDependencies.flutterEngine,
                                               nibName: nil,
                                               bundle: nil)

        let channel = FlutterMethodChannel(name: "auth_channel", binaryMessenger: controller.binaryMessenger)

        channel.setMethodCallHandler { (call, result) in
            if call.method == "sendData" {
                if let args = call.arguments as? [String: Any], let message = args["message"] as? String {
                    self.isAuthenticated = message == "Success"
                    result("Message received successfully!")
                } else {
                    result(FlutterError(code: "INVALID_ARGUMENT", message: "Invalid data", details: nil))
                }
            } else {
                result(FlutterMethodNotImplemented)
            }
        }
        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
