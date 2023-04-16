import Foundation
import UIKit

class MainCoordinator {
    var window: UIWindow?
    var navigationController: UINavigationController = UINavigationController()
    
    init(window: UIWindow) {
        self.window = window
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
  
    func start() {
        let splashScreen = SplashViewController()
        splashScreen.modalPresentationStyle = .fullScreen
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.navigationController.present(splashScreen, animated: false, completion: nil)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak navigationController] in
            navigationController?.dismiss(animated: false, completion: nil)
        }
        
        let bookListCoordinator = BookListCoordinator(navigationController: navigationController)
        
        bookListCoordinator.start()
    }
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
}
