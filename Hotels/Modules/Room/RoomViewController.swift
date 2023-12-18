import SwiftUI

final class RoomViewController: BaseTableViewController {
    let cellReuseID = "cellReuseID"
}

extension RoomViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellReuseID,
            for: indexPath
        )

        cell.contentConfiguration = UIHostingConfiguration {
            RoomView(action: { [weak self] in
                self?.pushModule()})
        }

        return cell
    }
}

extension RoomViewController {
    override func setupViews() {
        super.setupViews()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseID)
        addNavBarButton(at: .left, image: UIImage(systemName: "chevron.left"))
        navigationItem.title = "Steigenberger Makadi"
    }

    func pushModule() {
        model.pushModuleHandler?()
    }

    override func navBarLeftButtonHandler() {
        model.closeUnitOrModuleHandler?()
    }
}
