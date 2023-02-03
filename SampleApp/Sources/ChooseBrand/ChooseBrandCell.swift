import UIKit
import NatDS

final class ChooseBrandCell: UITableViewCell {

    // MARK: - Private properties

    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = NatBorderRadius.medium
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let brandImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    // MARK: - Inits

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Internal methods

extension ChooseBrandCell {
    func configure(imageName: String) {
        brandImageView.image = UIImage(named: imageName)
    }
}

// MARK: - Private methods - UI

extension ChooseBrandCell {
    private func setup() {
        selectionStyle = .none
        backgroundColor = .black

        contentView.addSubview(cardView)
        cardView.addSubview(brandImageView)

        addConstraints()
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: NatSpacing.tiny),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -NatSpacing.small),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -NatSpacing.tiny),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: NatSpacing.small),

            brandImageView.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            brandImageView.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            brandImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: NatSpacing.tiny),
            brandImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            brandImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            brandImageView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -NatSpacing.tiny)

        ])
    }
}
