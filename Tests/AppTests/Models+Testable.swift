//
//  Models+Testable.swift
//  
//
//  Created by hien.tran on 2/7/21.
//

@testable import App
import Fluent

extension User {
    @discardableResult
    static func create(
        name: String = "Hien",
        username: String = "trhien",
        on database: Database
    ) throws -> User {
        let user = User(name: name, username: username)
        try user.save(on: database).wait()
        return user
    }
}

extension Acronym {
    @discardableResult
    static func create(
        short: String = "TIL",
        long: String = "Today I Learned",
        user: User? = nil,
        on database: Database
    ) throws -> Acronym {
        var acronymsUser = user

        if acronymsUser == nil {
            acronymsUser = try User.create(on: database)
        }

        let acronym = Acronym(
            short: short,
            long: long,
            userID: acronymsUser!.id!
        )

        try acronym.save(on: database).wait()
        return acronym
    }
}
