import SwiftUI

struct OnboardingView: View {

    @EnvironmentObject private var appState: AppState
    @State private var pageIndex: Int = 0

    var body: some View {
        TabView(selection: $pageIndex) {

            // PAGE 1 — INTRO
            VStack(spacing: 24) {
                Spacer()

                Image(systemName: "pawprint.fill")
                    .font(.system(size: 56))
                    .foregroundColor(.blue)

                Text("Let’s get to know your pet")
                    .font(.title2)
                    .fontWeight(.semibold)

                Text("This helps us personalise your PetGo experience")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)

                Spacer()

                PrimaryButton(title: "Get Started") {
                    pageIndex = 1
                }
            }
            .tag(0)
            .padding()

            // PAGE 2 — PET DETAILS (UI ONLY)
            VStack(spacing: 20) {
                Spacer()

                Circle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 96, height: 96)
                    .overlay(
                        Image(systemName: "photo")
                            .foregroundColor(.gray)
                    )

                VStack(spacing: 12) {
                    TextField("Pet Name", text: .constant(""))
                        .textFieldStyle(.roundedBorder)

                    HStack(spacing: 12) {
                        Capsule()
                            .fill(Color.blue.opacity(0.15))
                            .overlay(Text("🐶 Dog"))
                        Capsule()
                            .fill(Color.gray.opacity(0.15))
                            .overlay(Text("🐱 Cat"))
                    }
                    .frame(height: 40)

                    TextField("Breed", text: .constant(""))
                        .textFieldStyle(.roundedBorder)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.05), radius: 8)

                Spacer()

                PrimaryButton(title: "Next") {
                    pageIndex = 2
                }
            }
            .tag(1)
            .padding()

            // PAGE 3 — COMPLETE
            VStack(spacing: 24) {
                Spacer()

                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue.opacity(0.15))
                    .frame(width: 120, height: 120)
                    .overlay(
                        Image(systemName: "sparkles")
                            .font(.system(size: 40))
                            .foregroundColor(.blue)
                    )

                Text("You’re all set")
                    .font(.title2)
                    .fontWeight(.semibold)

                Text("You can update details anytime later")
                    .font(.body)
                    .foregroundColor(.secondary)

                Spacer()

                PrimaryButton(title: "Go to Home") {
                    appState.hasCompletedOnboarding = true
                }
            }
            .tag(2)
            .padding()
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .background(Color(.systemGroupedBackground))
    }
}

struct PrimaryButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(14)
        }
        .padding(.horizontal)
    }
}

#Preview {
    OnboardingView()
        .environmentObject(AppState())
}
