import Foundation
import UIKit
class ImageCache {
    static let shared = ImageCache()
    private let cache = NSCache<NSURL, UIImage>()
    
    func getImage(for url: URL, completion: @escaping (UIImage?) -> Void) {
        if let image = cache.object(forKey: url as NSURL) {
            completion(image)
        } else {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, let image = UIImage(data: data) else {
                    DispatchQueue.main.async { completion(nil) }
                    return
                }
                self.cache.setObject(image, forKey: url as NSURL)
                DispatchQueue.main.async { completion(image) }
            }
            task.resume()
        }
    }
}
