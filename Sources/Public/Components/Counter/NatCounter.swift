import UIKit

/**
 DOCS
 */

public final class NatCounter: UIView {

    private var numCounter: Int = 0
    private var subtractDisabledSet: Bool = false
    private var addDisabledSet: Bool = false

    let stackViewContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.layer.borderColor = NatColors.highEmphasis.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = getTokenFromTheme(\.borderRadiusMedium)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    let numCounterLabelView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.5
        view.layer.borderColor = NatColors.highEmphasis.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let numCounterLabel: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .body2, withWeight: .regular)
        label.textColor = getUIColorFromTokens(\.colorHighEmphasis)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    var label: UILabel = {
        let label = UILabel()
        label.font = NatFonts.font(ofSize: .button, withWeight: .medium)
        label.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    let subtractView: NatCounterButton = {
        let view = NatCounterButton()
        view.configure(iconLabel: "-")
        view.layer.borderWidth = 0.5
        view.layer.borderColor = NatColors.highEmphasis.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    let addView: NatCounterButton = {
        let view = NatCounterButton()
        view.configure(iconLabel: "+")
        view.layer.borderWidth = 0.5
        view.layer.borderColor = NatColors.highEmphasis.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private var size: Size
    // MARK: - Inits

    public init(size: Size = .semi) {
        self.size = size
        super.init(frame: .zero)

        numCounterLabel.text = "\(numCounter)"

        setupConstraints()
        setupButtons()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    /// Sets the label of NatCounter component
    /// - Parameter label: text always displayed above NatCounter
    public func configure(label: String?) {
        self.label.text = label
    }

    /// Sets the state of CounterButtons
    /// - Parameter button: An option from CounterButtonType enum: subtract, add or all
    /// - Parameter state: An option from State enum: enabled or disabled
    public func configure(button: CounterButtonType, state: State) {

        switch state {
        case .enabled:
            switch button {
            case .subtract:
                subtractView.currentState = .enabled
            case .add:
                addView.currentState = .enabled
            case .all:
                subtractView.currentState = .enabled
                addView.currentState = .enabled
            }

        case .disabled:
            switch button {
            case .subtract:
                subtractView.currentState = .disabled
                subtractView.iconLabel.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
                subtractDisabledSet = true
            case .add:
                addView.currentState = .disabled
                addView.iconLabel.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
                addDisabledSet = true
            case .all:
                subtractView.currentState = .disabled
                addView.currentState = .disabled
                subtractView.iconLabel.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
                addView.iconLabel.textColor = getUIColorFromTokens(\.colorMediumEmphasis)
                subtractDisabledSet = true
                addDisabledSet = true
            }
        }
    }

    // MARK: - Private methods

    private func setupButtons() {
        let borderRadius = getTokenFromTheme(\.borderRadiusMedium)

        switch size {
        case .semi:
            let sizeWidth = getTokenFromTheme(\.sizeSemi)
            let sizeHeight = getTokenFromTheme(\.sizeSemiX)

            subtractView.configure(height: sizeHeight, width: sizeWidth)
            addView.configure(height: sizeHeight, width: sizeWidth)
            subtractView.roundCorners(corners: [.topLeft, .bottomLeft],
                                      radius: borderRadius,
                                      sizeWidth: sizeWidth,
                                      sizeHeight: sizeHeight)
            addView.roundCorners(corners: [.topRight, .bottomRight],
                                 radius: borderRadius,
                                 sizeWidth: sizeWidth,
                                 sizeHeight: sizeHeight)
        case .medium:
            let sizeWidth = getTokenFromTheme(\.sizeSemiX)
            let sizeHeight = getTokenFromTheme(\.sizeMedium)

            subtractView.configure(height: sizeHeight, width: sizeWidth)
            addView.configure(height: sizeHeight, width: sizeWidth)

            subtractView.roundCorners(corners: [.topLeft, .bottomLeft],
                                      radius: borderRadius,
                                      sizeWidth: sizeWidth,
                                      sizeHeight: sizeHeight)

            addView.roundCorners(corners: [.topRight, .bottomRight],
                                 radius: borderRadius,
                                 sizeWidth: sizeWidth,
                                 sizeHeight: sizeHeight)
        }

        self.checkLimit()

        subtractView.configure {
            self.checkLimit()
            self.numCounter -= 1
            self.numCounterLabel.text = "\(self.numCounter)"
        }

        addView.configure {
            self.checkLimit()
            self.numCounter += 1
            self.numCounterLabel.text = "\(self.numCounter)"
        }
    }

    private func checkLimit() {

        if subtractDisabledSet == false {
            if numCounter <= 1 {
                subtractView.currentState = .disabled
            } else if numCounter > 0 {
                subtractView.currentState = .enabled
            }
        }

        if addDisabledSet == false {
            if numCounter >= 98 {
                addView.currentState = .disabled
            } else if numCounter < 99 {
                addView.currentState = .enabled
            }
        }
    }

    private func setupConstraints() {
        addSubview(label)
        addSubview(stackViewContainer)

        numCounterLabelView.addSubview(numCounterLabel)
        stackViewContainer.addArrangedSubview(subtractView)
        stackViewContainer.addArrangedSubview(numCounterLabelView)
        stackViewContainer.addArrangedSubview(addView)

        NSLayoutConstraint.activate([
            stackViewContainer.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            stackViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackViewContainer.bottomAnchor.constraint(equalTo: bottomAnchor),

            numCounterLabel.centerYAnchor.constraint(equalTo: numCounterLabelView.centerYAnchor),
            numCounterLabel.centerXAnchor.constraint(equalTo: numCounterLabelView.centerXAnchor),

            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

extension UIView {
    func roundCorners(corners: UIRectCorner,
                      radius: CGFloat,
                      sizeWidth: CGFloat,
                      sizeHeight: CGFloat) {
        let path = UIBezierPath(roundedRect: CGRect(origin: .zero, size: CGSize(width: sizeWidth, height: sizeHeight)),
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
