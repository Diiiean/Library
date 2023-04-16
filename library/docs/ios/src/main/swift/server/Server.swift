protocol Server {
    func requestBookList(urlString: String, completion: @escaping (Result<[BookDTO], Error>) -> Void)
}
