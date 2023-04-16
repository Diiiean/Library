import UIKit

class BookCell: UITableViewCell {
    static let identifier = "bookCell"
    
    let coverImageView: UIImageView = UIImageView()
    let titleLabel: UILabel = UILabel()
    let yearLabel: UILabel = UILabel()
    
    private lazy var containerStackView: UIStackView = UIStackView(arrangedSubviews: [detailsStackView,
                                                                                      coverImageView])
    private lazy var detailsStackView: UIStackView = UIStackView(arrangedSubviews: [titleLabel,
                                                                                    yearLabel])
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    private func configureUI() {
        configureCell()
        configureTitleLabel()
        configureYearLabel()
        configureCoverImageView()
        configureContainerStackView()
        configureDetailsStackView()
    }
    
    func configure(with book: Book) {
        titleLabel.text = book.title
        coverImageView.image = book.coverImage
        if let year = book.firstPublishYear {
            yearLabel.text = "\(year)"
        } else {
            yearLabel.text = "Unknown"
        }
    }
    
    private func configureCell() {
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(containerStackView)
    }
    
    private func configureTitleLabel() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel.numberOfLines = 0
        titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)

        titleLabel.contentMode = .scaleAspectFit
        titleLabel.sizeToFit()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureYearLabel() {
        yearLabel.font = .systemFont(ofSize: 22)
        yearLabel.numberOfLines = 0
        yearLabel.contentMode = .scaleToFill
        yearLabel.sizeToFit()
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureCoverImageView() {
        coverImageView.backgroundColor = .systemBackground
        coverImageView.contentMode = .scaleAspectFit
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureContainerStackView() {
        containerStackView.axis = .horizontal
        containerStackView.alignment = .leading
        containerStackView.spacing = 10
        containerStackView.distribution = .fill
        containerStackView.setContentHuggingPriority(.required, for: .horizontal)
        containerStackView.clipsToBounds = true
        containerStackView.autoresizesSubviews = true
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureDetailsStackView() {
        detailsStackView.axis = .vertical
        detailsStackView.alignment = .leading
        detailsStackView.spacing = 15
        detailsStackView.distribution = .fill
        detailsStackView.setContentHuggingPriority(.required, for: .horizontal)
        detailsStackView.clipsToBounds = true
        detailsStackView.autoresizesSubviews = true
        detailsStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        coverImageView.image = nil
        titleLabel.text = nil
        yearLabel.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
        setCoverImageViewConstraints()
        setContainerStackViewConstraints()
    }
    
    private func setCoverImageViewConstraints() {
        NSLayoutConstraint.activate([
            coverImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/3)
        ])
    }
    
    private func setDetailsStackViewConstraints() {
        NSLayoutConstraint.activate([
            detailsStackView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    private func setContainerStackViewConstraints() {
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 10
            ),
            containerStackView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 30
            ),
            containerStackView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -10
            ),
            containerStackView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -10
            ),
        ])
    }
}



