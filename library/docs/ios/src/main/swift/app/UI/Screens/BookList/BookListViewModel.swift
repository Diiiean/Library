import Foundation
import UIKit

class BookListViewModel: BookListViewModelProtocol {
    private let apiServer: Server
    private let url = ApiConstants.defineUrl(with: "biology", "15")
    var books = [Book]()
    
    init(server: Server) {
        self.apiServer = server
    }

    func getBookListData(completionHandler: @escaping (Result<[Book], BookListError>) -> Void) {
        apiServer.requestBookList(urlString: url) { result in
            switch result {
            case .success(let books):
                self.books = books.compactMap { book in
                    let title = book.title ?? "N/A"
                    let publishDate = String(book.firstPublishYear ?? 0)
                    let firstSentence = book.firstSentence ?? "N/A"
                    let rating = book.rating ?? 0
                    var coverImage = UIImage(named: "avatarBook")
                    if let coverURL = book.coverURL {
                                           ImageCache.shared.getImage(for: coverURL) { image in
                                               if let image = image {
                                                   coverImage = image
                                               }
                                           }
                                       } 
                    return Book(
                        bookTitle: title,
                        firstPublishYear: publishDate,
                        coverImage: coverImage,
                        firstSentence: firstSentence,
                        rating: rating
                    )
                }
                completionHandler(.success(self.books))
            case .failure(let error):
                completionHandler(.failure(.networkError(error)))
            }
        }
    }
}


