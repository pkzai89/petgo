import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                // Header
                HStack(alignment: .center) {
                    Text("Profile")
                        .font(.largeTitle).bold()
                    Spacer()
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.title2.bold())
                            .foregroundColor(.secondary)
                            .padding(8)
                    }
                }
                // Avatar
                HStack {
                    Spacer()
                    ZStack {
                        Circle()
                            .fill(Color(.systemGray5))
                            .frame(width: 100, height: 100)
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                }
                // Name and subtitle
                VStack(spacing: 4) {
                    Text("Pet Owner")
                        .font(.title2).bold()
                        .foregroundColor(.primary)
                    Text("Manage your account and pets")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                // My Pets Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("My Pets")
                        .font(.headline)
                        .padding(.bottom, 2)
                    VStack(spacing: 12) {
                        ForEach(0..<2) { _ in
                            HStack(spacing: 16) {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(.systemGray5))
                                    .frame(width: 56, height: 56)
                                    .overlay(
                                        Image(systemName: "pawprint")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 32, height: 32)
                                            .foregroundColor(.secondary)
                                    )
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Pet Name")
                                        .font(.body).bold()
                                    Text("Breed")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.secondary)
                            }
                            .padding(12)
                            .background(Color(.systemBackground))
                            .cornerRadius(16)
                        }
                    }
                }
                // Account Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Account")
                        .font(.headline)
                        .padding(.bottom, 2)
                    VStack(spacing: 1) {
                        ProfileRow(icon: "person", title: "Edit Profile")
                        ProfileRow(icon: "pawprint", title: "Manage Pets")
                        ProfileRow(icon: "creditcard", title: "Subscription")
                    }
                }
                Spacer(minLength: 24)
            }
            .padding(.horizontal, 20)
            .padding(.top, 32)
            .padding(.bottom, 40)
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}

private struct ProfileRow: View {
    let icon: String
    let title: String
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.blue)
                .frame(width: 32, height: 32)
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
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
