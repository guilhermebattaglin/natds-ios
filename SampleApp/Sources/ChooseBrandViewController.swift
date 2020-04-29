import UIKit
import NatDS

class ChooseBrandViewController: UIViewController {
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()

    private let brands = [
        "Avon",
        "Natura",
        "The Body Shop"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Choose a Brand"
        setup()

        tableView.delegate = self
        tableView.dataSource = self
    }

    private func setup() {
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }
}

extension ChooseBrandViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        brands.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseIdentifier, for: indexPath)

        cell.textLabel?.text = brands[indexPath.row]

        return cell
    }
}

extension ChooseBrandViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            DesignSystem().configure(with: .avon)
        case 1:
            DesignSystem().configure(with: .natura)
        case 2:
            DesignSystem().configure(with: .theBodyShop)
        default:
            fatalError("Not implemented")
        }

        let viewController = MainViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.navigationBar.barTintColor = DSColors.primary
        navigationController.navigationBar.tintColor = DSColors.onPrimary
        navigationController.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: DSColors.onPrimary
        ]
        self.navigationController?.present(navigationController, animated: true)
    }
}
