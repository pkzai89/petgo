import SwiftUI
import Combine

class AppState: ObservableObject {
    enum AppFlowState {
        case onboarding, home
    }
    
    struct Pet: Identifiable, Equatable {
        let id: UUID
        let name: String
        let species: String
    }
    
    @Published var flowState: AppFlowState = .home
    @Published var pets: [Pet] = []
    @Published var selectedPetID: UUID?
    
    var selectedPet: Pet? {
        pets.first { $0.id == selectedPetID }
    }
}
