import SwiftUI
import Combine

final class AppSession: ObservableObject {

    enum State {
        case loggedOut
        case onboarding
        case home
    }

    @Published var state: State = .loggedOut

    func completeLogin() {
        state = .onboarding
    }

    func completeOnboarding() {
        state = .home
    }

    func logout() {
        state = .loggedOut
    }
}
