import SwiftUI
import FirebaseCore

@main
struct PetGoApp: App {

    @StateObject private var appState = AppState()

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            AppEntryView()
                .environmentObject(appState)
        }
    }
}
