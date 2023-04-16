import UIKit
import Foundation

class BookDetailsCoordinator {
    var navigationController: UINavigationController
   
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(with book: Book) {
        let viewModel = BookDetailsViewModel(book: book)
        let bookDeatilsViewController = BookDetailsViewController(coordinator: self, viewModel: viewModel)
        navigationController.pushViewController(bookDeatilsViewController, animated: true)
    }
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
}
