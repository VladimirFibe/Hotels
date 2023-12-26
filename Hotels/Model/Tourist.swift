import Foundation

struct Tourist: Identifiable {
    var id: String
    var firstname = ""
    var lastname = ""
    var birthday = ""
    var citizen = ""
    var passport = ""
    var validDate = ""

    var validFields: Bool {
        !firstname.isEmpty && !lastname.isEmpty && !birthday.isEmpty && !citizen.isEmpty && !passport.isEmpty && !validDate.isEmpty
    }
}
