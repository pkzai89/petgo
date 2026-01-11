import SwiftUI

struct LoginView: View {

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

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
    }
}
