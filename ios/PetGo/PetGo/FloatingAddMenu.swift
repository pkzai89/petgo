import SwiftUI

struct FloatingAddMenu: View {
    @Binding var isPresented: Bool
    @State private var showMemory = false
    @State private var showReminder = false
    @State private var showPet = false

    var body: some View {
        ZStack {
            if isPresented {
                // Scrim
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isPresented = false
                    }
                // Bottom sheet
                VStack {
                    Spacer()
                    VStack(spacing: 0) {
                        // Drag indicator
                        Capsule()
                            .frame(width: 40, height: 5)
                            .foregroundColor(Color(.systemGray4))
                            .padding(.top, 12)
                        // Header
                        VStack(spacing: 6) {
                            Text("Create")
                                .font(.title).bold()
                                .foregroundColor(.primary)
                                .frame(maxWidth: .infinity, alignment: .center)
                            Text("Add something new to PetGo")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                        .padding(.top, 8)
                        .padding(.bottom, 8)
                        // Action rows
                        VStack(spacing: 14) {
                            AddMenuActionRow(
                                icon: "photo.on.rectangle",
                                title: "Add Memory",
                                subtitle: "Photos, notes, and milestones"
                            )
                            AddMenuActionRow(
                                icon: "bell",
                                title: "Add Reminder",
                                subtitle: "Vet visits, meds, and tasks"
                            )
                            AddMenuActionRow(
                                icon: "pawprint",
                                title: "Add Pet",
                                subtitle: "Create a pet profile"
                            )
                        }
                        .padding(.top, 10)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 24)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 24, style: .continuous)
                            .fill(Color(.systemGroupedBackground))
                            .ignoresSafeArea(edges: .bottom)
                    )
                    .padding(.horizontal, 0)
                    .shadow(color: Color(.black).opacity(0.08), radius: 8, x: 0, y: -2)
                }
                .transition(.move(edge: .bottom))
                .animation(.easeInOut, value: isPresented)
            }
        }
    }
}


private struct AddMenuActionRow: View {
    let icon: String
    let title: String
    let subtitle: String
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color(.systemGray5))
                    .frame(width: 48, height: 48)
                Image(systemName: icon)
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.blue)
            }
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.blue)
        }
        .padding(.vertical, 14)
        .padding(.horizontal, 16)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color(.black).opacity(0.06), radius: 4, x: 0, y: 2)
    }
}

struct FloatingAddMenu_Previews: PreviewProvider {
    static var previews: some View {
        FloatingAddMenu(isPresented: .constant(true))
            .background(Color.gray.opacity(0.2))
            .ignoresSafeArea()
    }
}
