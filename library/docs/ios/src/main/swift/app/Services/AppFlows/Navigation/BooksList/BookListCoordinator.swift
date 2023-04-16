import UIKit
import Foundation

class BookListCoordinator {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    lazy var server = appDelegate.services.server
    
    var navigationController: UINavigationController
   
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = BookListViewModel(server: server)
        let bookListViewController = BookListViewController(coordinator: self, viewModel: viewModel)
        navigationController.pushViewController(bookListViewController, animated: true)
    }
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
    
    func goToBookDetailsViewController(for book: Book) {
        let bookDetailsCoordinator = BookDetailsCoordinator(navigationController: navigationController)
        bookDetailsCoordinator.start(with: book)
    }
}
