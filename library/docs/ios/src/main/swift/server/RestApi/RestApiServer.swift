import Foundation

class RestApiServer: Server {
    func requestBookList(urlString: String, completion: @escaping (Result<[BookDTO], Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print(error)
                    completion(.failure(NetworkError.requestFailed))
                    return
                }
                if let data = data {
                    do {
                        let response = try JSONDecoder().decode(BookResponseDTO.self, from: data)
                        let books = response.docs
                        completion(.success(books))
                    } catch let jsonError {
                        print("Failed to decode JSON", jsonError)
                        completion(.failure(NetworkError.invalidResponse))
                    }
                }
            }
        }.resume()
    }
}
