import UIKit

class SplashViewController: UIViewController {
    private let splashView: SplashView = SplashView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        configureView()
    }
    
    private func configureView() {
        view.backgroundColor = .systemBackground
        view.addSubview(splashView)
        setSplashViewConstraints()
    }
    
    private  func setSplashViewConstraints() {
        NSLayoutConstraint.activate([
            splashView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            splashView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            splashView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            splashView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
