import SwiftUI

@main
struct PetGoApp: App {

    @StateObject private var session = AppSession()

    var body: some Scene {
        WindowGroup {
            AppEntryView(session: session)
        }
    }
}
