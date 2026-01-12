import SwiftUI

struct PetHeaderView: View {

    let petName: String
    let petSummary: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(petName)
                .font(.title)
                .fontWeight(.bold)

            Text(petSummary)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemGroupedBackground))
        )
        .padding(.horizontal)
    }
}
