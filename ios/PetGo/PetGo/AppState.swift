import SwiftUI
import Combine
import FirebaseAuth

final class AppState: ObservableObject {

    // MARK: - Auth

    enum AuthStatus {
        case loggedOut
        case loggedIn
    }

    // MARK: - Global Modals

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

        var id: String { String(describing: self) }
    }

    // MARK: - Published State

    @Published var authStatus: AuthStatus = .loggedIn
    @Published var hasCompletedOnboarding: Bool = true
    @Published var activeModal: AppModal?

    // MARK: - Firebase Auth Listener

    private var authListener: AuthStateDidChangeListenerHandle?

    init() {
        authListener = Auth.auth().addStateDidChangeListener { _, user in
            DispatchQueue.main.async {
                self.authStatus = (user == nil) ? .loggedOut : .loggedIn
            }
        }
    }

    deinit {
        if let authListener {
            Auth.auth().removeStateDidChangeListener(authListener)
        }
    }

    // MARK: - Auth Actions

    func logOut() {
        try? Auth.auth().signOut()
    }

    // MARK: - Onboarding

    func completeOnboarding() {
        hasCompletedOnboarding = true
    }
}
