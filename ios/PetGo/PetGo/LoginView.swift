import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appState: AppState

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Image(systemName: "pawprint.fill")
                .font(.system(size: 56))
                .foregroundColor(.blue)

            Text("PetGo")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Login coming soon")
                .foregroundColor(.secondary)

            Button(action: {
                appState.logIn()
                dismiss()
            }) {
                Text("Log in")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(14)
            }
            .padding(.horizontal)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
    }
}
