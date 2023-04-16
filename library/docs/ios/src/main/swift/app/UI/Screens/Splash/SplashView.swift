import UIKit

class SplashView: UIView {
    private var projectName: String = "Library app"
    private var version: String = "version=20230416-1"
    
    private var projectNameLabel: UILabel = UILabel()
    private var versionLabel: UILabel = UILabel()
    private lazy var detailsStackView: UIStackView = UIStackView(arrangedSubviews: [projectNameLabel,
                                                                                    versionLabel])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        configureView()
        configureNameLabel()
        configureVersionLabel()
        configureDetailsStackView()
        setStackViewConstraints()
    }
    
    private func configureView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
    }
    
    private func configureNameLabel() {
        projectNameLabel.text = projectName
        projectNameLabel.numberOfLines = 0
        projectNameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureVersionLabel() {
        versionLabel.text = version
        versionLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureDetailsStackView() {
        addSubview(detailsStackView)
        detailsStackView.axis = .vertical
        detailsStackView.alignment = .center
        detailsStackView.spacing = 20
        detailsStackView.distribution = .fillEqually
        detailsStackView.clipsToBounds = true
        detailsStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setStackViewConstraints() {
        NSLayoutConstraint.activate([
            detailsStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            detailsStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

