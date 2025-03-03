import CoreData
import Foundation


protocol QRMessageRepositoryDataSource {
    func saveString(_ value: String)
    func getString() -> String?
}

class QRMessageRepository: QRMessageRepositoryDataSource {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext = CoreDataManager.shared.context) {
        self.context = context
    }

    func saveString(_ value: String) {
        let fetchRequest: NSFetchRequest<QRScannerEntity> = QRScannerEntity.fetchRequest()

        do {
            let results = try context.fetch(fetchRequest)

            if !results.contains(where: { $0.scannedQR == value }) {
                let storedQR = QRScannerEntity(context: context)
                storedQR.scannedQR = value
                try context.save()
            }
        } catch {
            print("Failed to save string: \(error.localizedDescription)")
        }
    }

    func getString() -> String? {
        let fetchRequest: NSFetchRequest<QRScannerEntity> = QRScannerEntity.fetchRequest()

        do {
            let results = try context.fetch(fetchRequest)
            let index = results.count > 2 ? results.count - 2 : 0
            return results[index].scannedQR
        } catch {
            print("Failed to fetch string: \(error.localizedDescription)")
            return nil
        }
    }
}
