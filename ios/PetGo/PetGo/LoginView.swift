import SwiftUI
import FirebaseAuth

struct LoginView: View {

    @EnvironmentObject private var appState: AppState

    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isCreatingAccount: Bool = false
    @State private var isLoading: Bool = false
    @State private var errorMessage: String?

    var body: some View {
        VStack(spacing: 24) {

            Spacer()

            VStack(spacing: 8) {
                Text("Welcome to PetGo")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text(isCreatingAccount
                     ? "Create an account to get started"
                     : "Sign in with your email to continue")
                    .foregroundColor(.secondary)
            }

            VStack(spacing: 16) {
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)

                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
            }

            if let errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.footnote)
                    .multilineTextAlignment(.center)
            }

            Button {
                authenticate()
            } label: {
                ZStack {
                    if isLoading {
                        ProgressView()
                    } else {
                        Text(isCreatingAccount ? "Create Account" : "Sign In")
                            .fontWeight(.semibold)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(14)
            }
            .disabled(isLoading || email.isEmpty || password.isEmpty)

            Button {
                isCreatingAccount.toggle()
                errorMessage = nil
            } label: {
                Text(isCreatingAccount
                     ? "Already have an account? Sign In"
                     : "Don’t have an account? Create one")
                    .font(.footnote)
            }

            Spacer()
        }
        .padding()
    }

    // MARK: - Auth Logic

    private func authenticate() {
        errorMessage = nil
        isLoading = true

        if isCreatingAccount {
            Auth.auth().createUser(withEmail: email, password: password) { _, error in
                handleAuthResult(error)
            }
        } else {
            Auth.auth().signIn(withEmail: email, password: password) { _, error in
                handleAuthResult(error)
            }
        }
    }

    private func handleAuthResult(_ error: Error?) {
        DispatchQueue.main.async {
            isLoading = false
            if let error {
                errorMessage = error.localizedDescription
            }
        }
    }
}
