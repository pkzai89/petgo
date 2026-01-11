import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var session: AppSession
    @State private var pageIndex: Int = 0

    var body: some View {
        TabView(selection: $pageIndex) {
            // MARK: - PAGE 1 — INTRO
            VStack(spacing: 20) {
                Spacer()
                Image(systemName: "pawprint.fill")
                    .font(.system(size: 64))
                    .foregroundColor(.blue)
                    .padding(.bottom, 8)
                Text("Let’s get to know your pet")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("This helps us personalise your PetGo experience")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                Spacer()
                PrimaryButton(title: "Get Started") {
                    withAnimation(.easeInOut) {
                        pageIndex = 1
                    }
                }
                .padding(.bottom, 12)
            }
            .tag(0)
            .padding(.horizontal)
            .transition(.opacity)
            // MARK: - PAGE 2 — PET DETAILS
            VStack(spacing: 24) {
                Spacer()
                Circle()
                    .fill(Color.gray.opacity(0.15))
                    .frame(width: 96, height: 96)
                    .overlay(
                        Image(systemName: "photo")
                            .foregroundColor(.gray)
                            .font(.system(size: 24))
                    )
                    .padding(.bottom, 8)
                VStack(spacing: 14) {
                    TextField("Pet Name", text: .constant(""))
                        .textFieldStyle(.roundedBorder)
                    HStack(spacing: 12) {
                        SpeciesPill(title: "🐶 Dog", selected: true)
                        SpeciesPill(title: "🐱 Cat", selected: false)
                    }
                    .frame(height: 40)

                    TextField("Breed", text: .constant(""))
                        .textFieldStyle(.roundedBorder)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(18)
                .shadow(color: .black.opacity(0.06), radius: 10, y: 4)
                .padding(.horizontal)

                Spacer()

                PrimaryButton(title: "Next") {
                    withAnimation(.easeInOut) {
                        pageIndex = 2
                    }
                }
                .padding(.bottom, 12)
            }
            .tag(1)
            .transition(.opacity)

            // MARK: - PAGE 3 — FINISH
            VStack(spacing: 24) {
                Spacer()
                Image(systemName: "checkmark.seal.fill")
                    .font(.system(size: 64))
                    .foregroundColor(.green)
                    .padding(.bottom, 8)
                Text("All set!")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("You’re ready to start using PetGo.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                Spacer()
                PrimaryButton(title: "Go to Home") {
                    session.state = .main
                }
                .padding(.bottom, 12)
            }
            .tag(2)
            .padding(.horizontal)
            .transition(.opacity)
            .tag(2)
            .transition(.opacity)
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .background(Color(.systemGroupedBackground))
        .animation(.easeInOut, value: pageIndex)
    }
}

// MARK: - Components

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
                .cornerRadius(16)
                .scaleEffect(0.98)
        }
        .padding(.horizontal)
    }
}

struct SpeciesPill: View {
    let title: String
    let selected: Bool

    var body: some View {
        Text(title)
            .fontWeight(.medium)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .background(
                selected
                ? Color.blue.opacity(0.15)
                : Color.gray.opacity(0.15)
            )
            .cornerRadius(20)
    }
}

#Preview {
    OnboardingView()
}
