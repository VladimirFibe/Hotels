import SwiftUI

final class RoomViewController: BaseTableViewController {
    let cellReuseID = "cellReuseID"
    var rooms: [Room] = []
    private let store: RoomStore
    init(store: RoomStore, model: Model) {
        self.store = store
        super.init(model: model)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RoomViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rooms.count
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
        setupObservers()
        store.sendAction(.fetch)
    }

    func pushModule() {
        model.pushModuleHandler?()
    }

    override func navBarLeftButtonHandler() {
        model.closeUnitOrModuleHandler?()
    }

    private func setupObservers() {
        store
            .events
            .receive(on: DispatchQueue.main)
            .sink {[weak self] event in
                switch event {
                case .done(let rooms):
                    self?.rooms = rooms
                    print(rooms.count)
                    print(rooms)
                    self?.tableView.reloadData()
                }
            }.store(in: &bag)
    }
}
