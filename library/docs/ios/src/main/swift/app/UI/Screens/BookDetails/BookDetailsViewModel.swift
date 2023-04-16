import UIKit

class BookDetailsViewModel: BookDetailsViewModelProtocol {
    var book: Book
  
    init(book: Book) {
        self.book = book
    }
}
