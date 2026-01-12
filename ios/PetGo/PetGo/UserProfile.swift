import Foundation

struct UserProfile: Identifiable, Codable {

    let id: String
    var email: String
    var displayName: String?
    var createdAt: Date

    // MARK: - Firestore manual mapping

    init(id: String, data: [String: Any]) {
        self.id = id
        self.email = data["email"] as? String ?? ""
        self.displayName = data["displayName"] as? String
        self.createdAt = (data["createdAt"] as? Date) ?? Date()
    }

    func toFirestoreData() -> [String: Any] {
        [
            "email": email,
            "displayName": displayName as Any,
            "createdAt": createdAt
        ]
    }
}
