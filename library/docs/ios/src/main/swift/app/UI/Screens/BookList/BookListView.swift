import UIKit

class BookListView: UIView {
    var bookListTableView: UITableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))

    var activityLoader = UIActivityIndicatorView()

    weak var delegate: UITableViewDelegate? {
            get {
                return bookListTableView.delegate
            }
            set {
                bookListTableView.delegate = newValue
            }
        }

    weak var dataSource: UITableViewDataSource? {
            get {
                return bookListTableView.dataSource
            }
            set {
                bookListTableView.dataSource = newValue
            }
        }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI() {
        configureView()
        configureBookListTableView()
    }

    private func configureView() {
        addSubview(bookListTableView)
        addSubview(activityLoader)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureActivityLoader() {
        activityLoader.style = .large
        activityLoader.color = .gray
        activityLoader.hidesWhenStopped = true
        activityLoader.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configureBookListTableView() {
        bookListTableView.backgroundColor = .systemBackground
        bookListTableView.register(BookCell.self, forCellReuseIdentifier: BookCell.identifier)
        bookListTableView.translatesAutoresizingMaskIntoConstraints = false
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        configureBookListTableView()
        configureActivityLoader()
        setActivityLoaderConstraints()
    }
    
    private func setActivityLoaderConstraints() {
        NSLayoutConstraint.activate([
            activityLoader.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityLoader.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
