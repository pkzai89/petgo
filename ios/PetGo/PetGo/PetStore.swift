import Foundation
import FirebaseFirestore
import FirebaseAuth

final class PetStore {

    static let shared = PetStore()
    private init() {}

    private let db = Firestore.firestore()

    // MARK: - Fetch pets

    func fetchPets(completion: @escaping ([Pet]) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {
            completion([])
            return
        }

        db.collection("users")
            .document(uid)
            .collection("pets")
            .getDocuments { snapshot, _ in

                let pets: [Pet] = snapshot?.documents.compactMap { doc in
                    let data = doc.data()

                    return Pet(
                        id: doc.documentID,
                        name: data["name"] as? String ?? "Unnamed",
                        species: data["species"] as? String
                    )
                } ?? []

                completion(pets)
            }
    }

    // MARK: - Add pet

    func addPet(
        name: String,
        species: String?,
        completion: (() -> Void)? = nil
    ) {
        guard let uid = Auth.auth().currentUser?.uid else {
            completion?()
            return
        }

        let data: [String: Any] = [
            "name": name,
            "species": species ?? "",
            "createdAt": Timestamp()
        ]

        db.collection("users")
            .document(uid)
            .collection("pets")
            .addDocument(data: data) { _ in
                completion?()
            }
    }
}
