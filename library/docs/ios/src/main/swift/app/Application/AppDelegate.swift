import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private lazy var coordinator: MainCoordinator = MainCoordinator(window: window!)
    private (set) var services: SettingsService
    
    override init() {
        services = SettingsService()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        coordinator.start()
        return true
    }
}

