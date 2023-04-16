import Foundation
import UIKit

class Book {
    let title: String?
    let firstPublishYear: String?
    let coverImage: UIImage?
    let firstSentence: String?
    let rating: String?
    
    init(bookTitle: String, firstPublishYear: String?, coverImage: UIImage?, firstSentence: String, rating: Float?) {
        self.title = bookTitle
        self.firstPublishYear = firstPublishYear
        self.coverImage = coverImage
        self.firstSentence = firstSentence
        
        if let rating = rating {
            let formattedRating = String(format: "%.1f", rating)
            self.rating = formattedRating
        } else {
            self.rating = nil
        }
    }
}
