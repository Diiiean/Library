import Foundation

struct ApiConstants {
    static var urlString = "https://openlibrary.org/search.json?q=history&limit=2"
    
    static func defineUrl(with bookQuery: String, _ limit: String) -> String {
        ApiConstants.urlString = "https://openlibrary.org/search.json?q=\(bookQuery)&limit=\(limit)"
        return ApiConstants.urlString
    }
}
