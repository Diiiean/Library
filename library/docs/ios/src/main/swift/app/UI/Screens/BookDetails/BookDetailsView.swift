import UIKit

class BookDetailsView: UIView {
    let coverImageView: UIImageView = UIImageView()
    let titleLabel: UILabel = UILabel()
    let yearLabel: UILabel = UILabel()
    let ratingLabel: UILabel = UILabel()
    let descriptionLabel: UILabel = UILabel()
    private lazy var containerStackView: UIStackView = UIStackView(arrangedSubviews: [titleLabel,
                                                                                      coverImageView,
                                                                                      detailsStackView])
    private lazy var detailsStackView: UIStackView = UIStackView(arrangedSubviews: [descriptionLabel,
                                                                                    yearLabel,
                                                                                    ratingLabel])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        configureView()
        configureTitleLabel()
        configureYearLabel()
        configureDescriptionLabel()
        configureRatingLabel()
        configureCoverImageView()
        configureContainerStackView()
        configureDetailsStackView()
    }
    
    func configure(with book: Book) {
        titleLabel.text = book.title
        coverImageView.image = book.coverImage
        if let description = book.firstSentence {
            descriptionLabel.text = description
        }
        if let year = book.firstPublishYear {
            let attributedString = NSMutableAttributedString(string: "Year: \(year)")
            attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: yearLabel.font.pointSize), range: NSRange(location: 0, length: 5))
            yearLabel.attributedText = attributedString
        }
        if let rating = book.rating {
            let attributedText = NSMutableAttributedString(string: "Rating: \(rating)/5.0")
            let boldFont = UIFont.boldSystemFont(ofSize: ratingLabel.font.pointSize)
            attributedText.addAttribute(.font, value: boldFont, range: NSRange(location: 0, length: 7))
            ratingLabel.attributedText = attributedText
        }
    }
    
    private func configureView() {
        addSubview(containerStackView)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureTitleLabel() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 33)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.contentMode = .scaleToFill
        titleLabel.sizeToFit()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureYearLabel() {
        yearLabel.font = .systemFont(ofSize: 25)
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
    
    private func configureDescriptionLabel() {
        descriptionLabel.font = .systemFont(ofSize: 25)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .justified
        descriptionLabel.contentMode = .scaleToFill
        descriptionLabel.sizeToFit()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureRatingLabel() {
        ratingLabel.font = .systemFont(ofSize: 25)
        ratingLabel.numberOfLines = 0
        ratingLabel.contentMode = .scaleToFill
        ratingLabel.sizeToFit()
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureContainerStackView() {
        containerStackView.axis = .vertical
        containerStackView.alignment = .center
        containerStackView.spacing = 35
        containerStackView.distribution = .fill
        containerStackView.autoresizesSubviews = true
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureDetailsStackView() {
        detailsStackView.axis = .vertical
        detailsStackView.alignment = .center
        detailsStackView.spacing = 20
        detailsStackView.distribution = .fill
        detailsStackView.clipsToBounds = true
        detailsStackView.autoresizesSubviews = true
        detailsStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setCoverImageViewConstraints()
        setContainerStackViewConstraints()
    }
    
    private func setCoverImageViewConstraints() {
        NSLayoutConstraint.activate([
            coverImageView.heightAnchor.constraint(equalToConstant: 200)
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
                equalTo: topAnchor,
                constant: 20
            ),
            containerStackView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 30
            ),
            containerStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -10
            ),
        ])
    }
}



