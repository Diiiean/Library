import UIKit
import Foundation

class BookDetailsViewController: UIViewController {
    private let viewControllerTitle = "Details"
    private var coordinator: BookDetailsCoordinator
    private let bookDetailsView: BookDetailsView = BookDetailsView(frame: .zero)
    private let viewModel: BookDetailsViewModelProtocol
    private let book: Book
    
    init(coordinator: BookDetailsCoordinator, viewModel: BookDetailsViewModelProtocol) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        self.book = viewModel.book
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        configureView()
    }
    
    private func configureView() {
        bookDetailsView.configure(with: book)
        title = viewControllerTitle
        view.backgroundColor = .systemBackground
        view.addSubview(bookDetailsView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setBookListViewConstraints()
    }
    
    private  func setBookListViewConstraints() {
        NSLayoutConstraint.activate([
            bookDetailsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bookDetailsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bookDetailsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bookDetailsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
