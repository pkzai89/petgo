import SwiftUI
import Combine

final class AppState: ObservableObject {

    // MARK: - Authentication & onboarding
    @Published var isAuthenticated: Bool = false
    @Published var hasCompletedOnboarding: Bool = false

    // MARK: - Global modal routing
    @Published var activeModal: AppModal? = nil

    // MARK: - Modal definitions
    enum AppModal: Identifiable {
        case profile
        case settings
        case notifications
        case help

        case addPet
        case addMemory
        case addReminder

        case petDetail
        case reminderDetail
        case placeDetail
        case productDetail
        case memoryDetail

        var id: String {
            switch self {
            case .profile: return "profile"
            case .settings: return "settings"
            case .notifications: return "notifications"
            case .help: return "help"

            case .addPet: return "addPet"
            case .addMemory: return "addMemory"
            case .addReminder: return "addReminder"

            case .petDetail: return "petDetail"
            case .reminderDetail: return "reminderDetail"
            case .placeDetail: return "placeDetail"
            case .productDetail: return "productDetail"
            case .memoryDetail: return "memoryDetail"
            }
        }
    }
}
