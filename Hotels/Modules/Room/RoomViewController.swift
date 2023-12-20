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
        cell.backgroundColor = .clear
        cell.contentConfiguration = UIHostingConfiguration {
            RoomView(action: { [weak self] in
                self?.pushModule()})
        }
        .margins([.horizontal, .bottom], 0)
        .margins(.top, 8)

        return cell
    }
}

extension RoomViewController {
    override func setupViews() {
        super.setupViews()
        view.backgroundColor = AppColor.xF6F6F9.uiColor
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseID)
        tableView.separatorStyle = .none
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
