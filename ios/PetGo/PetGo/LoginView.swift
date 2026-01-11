import SwiftUI

struct LoginView: View {

    @ObservedObject var session: AppSession

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.blue.opacity(0.8), Color.blue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 28) {
                Spacer()

                Image(systemName: "pawprint.fill")
                    .font(.system(size: 56))
                    .foregroundColor(.white)

                Text("Welcome to PetGo")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)

                VStack(spacing: 14) {

                    Button {
                        session.completeLogin()
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
                        session.completeLogin()
                    } label: {
                        HStack {
                            Image(systemName: "applelogo")
                            Text("Continue with Apple")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                    }

                    Button {
                        session.completeLogin()
                    } label: {
                        HStack {
                            Image(systemName: "g.circle")
                            Text("Continue with Google")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(14)
                    }
                }
                .padding(.horizontal)

                Spacer()
            }
        }
    }
}

#Preview {
    LoginView(session: AppSession())
}
