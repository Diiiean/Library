import UIKit
import Foundation

class BookListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let viewControllerTitle = "Books"
    private var coordinator: BookListCoordinator
    private let bookListView: BookListView = BookListView(frame: .zero)
    private let viewModel: BookListViewModelProtocol
    private var books: [Book] = []
    private var shouldPerformAPICall = true
    
    init(coordinator: BookListCoordinator, viewModel: BookListViewModelProtocol) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        getBookListData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        shouldPerformAPICall = false
        getBookListData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        configureView()
    }
    
    private func configureView() {
        title = viewControllerTitle
        
        bookListView.delegate = self
        bookListView.dataSource = self
        
        view.backgroundColor = .systemBackground
        view.addSubview(bookListView)
    }
    
    private func getBookListData() {
        if shouldPerformAPICall {
            bookListView.activityLoader.startAnimating()
        }
        viewModel.getBookListData { [weak self] result in
            guard let self = self else { return }
            bookListView.activityLoader.stopAnimating()
            switch result {
            case .success(let books):
                self.books = books
                DispatchQueue.main.async {
                    self.bookListView.bookListTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.books.count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: BookCell.identifier,
            for: indexPath
        ) as? BookCell else { return UITableViewCell() }
        let book = books[indexPath.row]
        cell.configure(with: book)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        coordinator.goToBookDetailsViewController(for: books[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setBookListViewConstraints()
    }
    
    private  func setBookListViewConstraints() {
        NSLayoutConstraint.activate([
            bookListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bookListView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bookListView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bookListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
