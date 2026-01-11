import SwiftUI
import Combine

final class AppState: ObservableObject {

    // MARK: - App Flow

    enum AuthStatus {
        case loggedIn
        case loggedOut
    }

    @Published var authStatus: AuthStatus = .loggedIn
    @Published var hasCompletedOnboarding: Bool = true

    // MARK: - Global Modal Routing

    enum AppModal: Identifiable {
        case addPet
        case addMemory
        case addReminder

        case petDetail
        case memoryDetail
        case reminderDetail
        case placeDetail
        case productDetail

        case profile
        case settings
        case notifications
        case help

        case login

        var id: String {
            switch self {
            case .addPet: return "addPet"
            case .addMemory: return "addMemory"
            case .addReminder: return "addReminder"

            case .petDetail: return "petDetail"
            case .memoryDetail: return "memoryDetail"
            case .reminderDetail: return "reminderDetail"
            case .placeDetail: return "placeDetail"
            case .productDetail: return "productDetail"

            case .profile: return "profile"
            case .settings: return "settings"
            case .notifications: return "notifications"
            case .help: return "help"
                case .login: return "login"
            }
        }
    }

    @Published var activeModal: AppModal? = nil

    // MARK: - Auth Actions (Firebase-ready)

    func logIn() {
        authStatus = .loggedIn
    }

    func logOut() {
        authStatus = .loggedOut
    }
}
