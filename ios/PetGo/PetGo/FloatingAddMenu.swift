import SwiftUI

struct FloatingAddMenu: View {
    @Binding var isPresented: Bool
    @EnvironmentObject private var appState: AppState

    var body: some View {
        // Defensive: Never show or allow menu if logged out
        if appState.authStatus == .loggedIn {
            ZStack {
                if isPresented {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                        .onTapGesture { isPresented = false }

                    VStack {
                        Spacer()

                        VStack(spacing: 14) {
                            Capsule()
                                .frame(width: 40, height: 5)
                                .foregroundColor(Color(.systemGray4))
                                .padding(.top, 12)

                            Text("Create")
                                .font(.title)
                                .fontWeight(.bold)

                            Text("Add something new to PetGo")
                                .font(.subheadline)
                                .foregroundColor(.secondary)

                            Button {
                                isPresented = false
                                appState.activeModal = .addMemory
                            } label: {
                                AddMenuRow(icon: "photo", title: "Add Memory")
                            }

                            Button {
                                isPresented = false
                                appState.activeModal = .addReminder
                            } label: {
                                AddMenuRow(icon: "bell", title: "Add Reminder")
                            }

                            Button {
                                isPresented = false
                                appState.activeModal = .addPet
                            } label: {
                                AddMenuRow(icon: "pawprint", title: "Add Pet")
                            }
                        }
                        .padding()
                        .background(Color(.systemGroupedBackground))
                        .cornerRadius(24)
                    }
                    .transition(.move(edge: .bottom))
                }
            }
        } else {
            // Defensive: If called while logged out, auto-dismiss
            EmptyView()
                .onAppear {
                    if isPresented {
                        DispatchQueue.main.async { isPresented = false }
                    }
                }
        }
    }
}

private struct AddMenuRow: View {
    let icon: String
    let title: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.blue)
            Text(title)
                .fontWeight(.semibold)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(14)
    }
}
