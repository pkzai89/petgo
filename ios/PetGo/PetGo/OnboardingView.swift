import SwiftUI

struct OnboardingView: View {

    @Environment(\.dismiss) private var dismiss
    @State private var pageIndex: Int = 0

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Group {
                if pageIndex == 0 {
                    onboardingPage(
                        title: "Welcome to PetGo",
                        subtitle: "Everything your pet needs, in one place"
                    )
                } else if pageIndex == 1 {
                    onboardingPage(
                        title: "Track & remember",
                        subtitle: "Memories, reminders, and milestones"
                    )
                } else {
                    onboardingPage(
                        title: "Let’s get started",
                        subtitle: "Your pet’s life, beautifully organised"
                    )
                }
            }

            Spacer()

            Button {
                if pageIndex < 2 {
                    pageIndex += 1
                } else {
                    dismiss()
                }
            } label: {
                Text(pageIndex < 2 ? "Next" : "Get Started")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(14)
            }
            .padding(.horizontal, 24)

            Spacer()
        }
        .background(Color(.systemGroupedBackground))
        .ignoresSafeArea()
    }

    private func onboardingPage(title: String, subtitle: String) -> some View {
        VStack(spacing: 12) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)

            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 32)
    }
}
