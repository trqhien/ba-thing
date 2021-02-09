import Vapor
import Fluent

final class Acronym: Model {
    static let schema = "acronyms"

    @Parent(key: "user-id")
    var user: User

    @ID
    var id: UUID?

    @Field(key: "short")
    var short: String

    @Field(key: "long")
    var long: String

    @Siblings(
        through: AcronymCategoryPivot.self,
        from: \.$acronym,
        to: \.$category
    )
    var categories: [Category]

    init() {}

    init(
        id: UUID? = nil,
        short: String,
        long: String,
        userID: User.IDValue
    ) {
        self.id = id
        self.short = short
        self.long = long
        self.$user.id = userID
    }
}

extension Acronym: Content {}
