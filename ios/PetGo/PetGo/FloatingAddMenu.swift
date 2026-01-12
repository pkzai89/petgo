import SwiftUI

struct FloatingAddMenu: View {

    @EnvironmentObject var appState: AppState
    @Binding var isPresented: Bool

    var body: some View {
        VStack(spacing: 16) {

            Button {
                isPresented = false
                appState.activeModal = .addPet
            } label: {
                Label("Add Pet", systemImage: "pawprint.fill")
            }

            Button {
                isPresented = false
                appState.activeModal = .profile
            } label: {
                Label("Profile", systemImage: "person.crop.circle")
            }

            Button {
                isPresented = false
                appState.activeModal = .settings
            } label: {
                Label("Settings", systemImage: "gearshape.fill")
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(16)
        .shadow(radius: 10)
    }
}
