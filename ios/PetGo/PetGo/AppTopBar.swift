import SwiftUI

struct AppTopBar: View {

    @EnvironmentObject private var appState: AppState

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("PetGo")
                    .font(.headline)
                Text("For the love of pets")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Button {
                appState.activeModal = .profile
            } label: {
                Image(systemName: "person.crop.circle")
                    .font(.title2)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 12)
        .padding(.bottom, 10)
        .background(Color(.systemBackground))
    }
}
