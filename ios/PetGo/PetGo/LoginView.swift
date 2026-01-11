import SwiftUI

struct LoginView: View {
    @EnvironmentObject var session: AppSession

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.blue, Color.blue.opacity(0.75)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 28) {
                Spacer()

                Image(systemName: "pawprint.fill")
                    .font(.system(size: 64))
                    .foregroundColor(.white)
                    .padding(.bottom, 12)

                Text("Welcome to PetGo")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)

                Text("For the love of pets")
                    .font(.title3)
                    .foregroundColor(.white.opacity(0.9))

                Spacer()

                VStack(spacing: 16) {
                    Button {
                        session.state = .onboarding
                    } label: {
                        Text("Continue with Email")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.blue)
                            .cornerRadius(14)
                    }

                    Button {
                        session.state = .onboarding
                    } label: {
                        HStack {
                            Image(systemName: "applelogo")
                            Text("Continue with Apple")
                        }
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                    }

                    Button {
                        session.state = .onboarding
                    } label: {
                        HStack {
                            Image(systemName: "globe")
                            Text("Continue with Google")
                        }
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(14)
                    }
                }
                .padding(.horizontal)

                Spacer(minLength: 40)
            }
        }
    }
}

