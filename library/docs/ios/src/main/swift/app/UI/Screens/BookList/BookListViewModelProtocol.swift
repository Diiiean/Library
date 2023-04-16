protocol BookListViewModelProtocol {
    var books: [Book] { get }
    func getBookListData(completionHandler: @escaping (Result<[Book], BookListError>) -> Void)
}
