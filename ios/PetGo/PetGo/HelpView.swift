import SwiftUI

struct HelpView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                // Header
                HStack(alignment: .center) {
                    Text("How can we help?")
                        .font(.largeTitle).bold()
                    Spacer()
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.title2.bold())
                            .foregroundColor(.secondary)
                            .padding(8)
                    }
                }
                // Support Cards
                VStack(spacing: 16) {
                    HelpCard(icon: "questionmark.circle", title: "FAQs")
                    HelpCard(icon: "envelope", title: "Contact Support")
                    HelpCard(icon: "exclamationmark.bubble", title: "Report a Problem")
                }
                // About PetGo Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("About PetGo")
                        .font(.headline)
                        .padding(.bottom, 2)
                    VStack(spacing: 1) {
                        AboutRow(icon: "info.circle", title: "Version")
                        AboutRow(icon: "doc.text", title: "Terms & Privacy")
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

private struct HelpCard: View {
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

private struct AboutRow: View {
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
