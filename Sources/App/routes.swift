import Fluent
import Vapor

func routes(_ app: Application) throws {
    /*
     GET http://localhost:8080/api/acronyms/: get all the acronyms.
     • POST http://localhost:8080/api/acronyms: create a new acronym.
     • GET http://localhost:8080/api/acronyms/1: get the acronym with ID 1.
     • PUT http://localhost:8080/api/acronyms/1: update the acronym with ID 1.
     • DELETE http://localhost:8080/api/acronyms/1: delete the acronym with ID 1.
     */

    try app.register(collection: AcronymsController())
    try app.register(collection: UsersController())
    try app.register(collection: CategoriesController())
}
