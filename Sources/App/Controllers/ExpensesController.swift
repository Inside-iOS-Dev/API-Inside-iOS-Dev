import Vapor

final class ExpensesController {
    func index(_ request: Request) throws -> Future<Response> {
        let expenses: [Expense] = [
            Expense(id: 1, date: Date(), payee: "Vendor 1", note: nil, amountInCents: 700),
            Expense(id: 2, date: Date(), payee: "Vendor 2", note: "paint", amountInCents: 10),
            Expense(id: 3, date: Date(), payee: "Vendor 3", note: "materials", amountInCents: 545657),
            Expense(id: 4, date: Date(), payee: "Vendor 4", note: nil, amountInCents: 123123)
        ]
        let response = ExpensesResponse(expenses: expenses)
        return response.encode(status: .created, for: request)
    }
}

struct ExpensesResponse: Content {
    let expenses: [Expense]
}

struct Expense: Content {
    let id: Int
    let date: Date
    let payee: String
    let note: String?
    let amountInCents: Int
}
