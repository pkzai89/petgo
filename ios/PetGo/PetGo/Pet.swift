import Foundation

struct Pet: Identifiable, Codable, Equatable {
    let id: String
    var name: String
    var dateOfBirth: Date?
    var species: String?

    init(
        id: String = UUID().uuidString,
        name: String,
        dateOfBirth: Date? = nil,
        species: String? = nil
    ) {
        self.id = id
        self.name = name
        self.dateOfBirth = dateOfBirth
        self.species = species
    }
}

extension Pet {
    var ageDescription: String {
        guard let dob = dateOfBirth else {
            return "Age unknown"
        }

        let components = Calendar.current.dateComponents([.year, .month], from: dob, to: Date())

        if let years = components.year, years > 0 {
            return "\(years) year\(years == 1 ? "" : "s") old"
        }

        if let months = components.month, months > 0 {
            return "\(months) month\(months == 1 ? "" : "s") old"
        }

        return "Less than a month old"
    }
}
