import SwiftUI
import Combine

@MainActor
final class AppState: ObservableObject {

    // MARK: - App flow
    @Published var hasCompletedOnboarding: Bool = false

    // MARK: - Global modal routing
    @Published var activeModal: AppModal? = nil

    // MARK: - Modal definitions
    enum AppModal: Identifiable {
        case addPet
        case addMemory
        case addReminder

        case petDetail
        case reminderDetail
        case placeDetail
        case productDetail
        case memoryDetail

        case profile
        case settings
        case notifications
        case help

        var id: String {
            String(describing: self)
        }
    }
}
