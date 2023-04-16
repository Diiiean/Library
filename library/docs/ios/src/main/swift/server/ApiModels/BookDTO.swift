import Foundation

struct BookDTO: Codable {
    let title: String?
    let firstPublishYear: Int?
    let coverID: Int?
    let firstSentence: String?
    let rating: Float?

    var coverURL: URL? {
        if let coverID = coverID {
            return URL(string: "https://covers.openlibrary.org/b/id/\(coverID)-M.jpg")
        }
        return nil
    }

    enum CodingKeys: String, CodingKey {
        case title
        case firstPublishYear = "first_publish_year"
        case coverID = "cover_i"
        case firstSentence = "first_sentence"
        case rating = "ratings_average"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        firstPublishYear = try container.decodeIfPresent(Int.self, forKey: .firstPublishYear)
        coverID = try container.decodeIfPresent(Int.self, forKey: .coverID)
        firstSentence = try container.decodeIfPresent([String].self, forKey: .firstSentence)?.first
        rating = try container.decodeIfPresent(Float.self, forKey: .rating)
    }
}
