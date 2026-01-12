import SwiftUI
import FirebaseAuth

struct LoginView: View {

    @EnvironmentObject private var appState: AppState

    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?

    var body: some View {
        VStack(spacing: 24) {

            Text("Welcome to PetGo")
                .font(.largeTitle)
                .fontWeight(.bold)

            VStack(spacing: 12) {
                TextField("Email", text: $email)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .textFieldStyle(.roundedBorder)

                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
            }

            if let errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.footnote)
            }

            Button("Log In") {
                logIn()
            }
            .buttonStyle(.borderedProminent)

            Button("Create Account") {
                signUp()
            }
            .font(.footnote)

            Spacer()
        }
        .padding()
    }

    // MARK: - Actions

    private func logIn() {
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            if let error {
                errorMessage = error.localizedDescription
            }
        }
    }

    private func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { _, error in
            if let error {
                errorMessage = error.localizedDescription
            }
        }
    }
}
