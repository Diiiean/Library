enum BookListError: Error {
    case networkError(Error)
    case invalidData
}
