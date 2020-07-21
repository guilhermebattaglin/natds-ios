import NatDS
import UIKit

class AppBarViewController: UITableViewController, SampleItem {
    static var name: String = "App Bar"

    private let dataSource: [(title: String, style: UINavigationController.Style)] = [
        (title: "Default", style: .default)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = Self.name

        setup()
    }

    // MARK: - Private methods

    private func setup() {
        view.backgroundColor = NatColors.background
        setupTableView()
    }

    private func setupTableView() {
        tableView.register(UITableViewCell.self)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
    }

    // MARK: - Tableview delegate and dataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = dataSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: UITableViewCell.self)
        cell.textLabel?.text = item.title
        cell.selectionStyle = .none
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = dataSource[indexPath.row]
        let viewController = AppBarDetailViewController(appBarStyle: item.style)
        let navigationController = UINavigationController(rootViewController: viewController)

        self.navigationController?.present(navigationController, animated: true, completion: nil)
    }
}
