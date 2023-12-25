import SwiftUI

final class BookViewController: BaseViewController {
    private let store: BookStore
    private let viewModel = BookViewModel()
    init(store: BookStore, model: Model) {
        self.store = store
        super.init(model: model)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var content = UIHostingController(
        rootView: BookView(action: { [weak self] in
            self?.pushModule()
        }))
}

extension BookViewController {
    override func setupViews() {
        super.setupViews()
        addIgnoringSafeArea(content)
        addNavBarButton(at: .left, image: UIImage(systemName: "chevron.left"))
        navigationItem.title = "Бронирование"
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
                case .done(let book):
                    self?.viewModel.book = book
                    print(book)
                }
            }.store(in: &bag)
    }
}
