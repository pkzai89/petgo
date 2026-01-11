import SwiftUI
import Combine

// MARK: - Session State Enum

enum SessionState {
    case loggedOut
    case onboarding
    case main
}

// MARK: - AppSession ObservableObject

class AppSession: ObservableObject {
    @Published var state: SessionState = .loggedOut
}
