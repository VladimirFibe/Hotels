import SwiftUI

final class HotelViewController: BaseViewController {
    private let store: HotelStore
    private var viewModel = HotelViewModel()
    private lazy var content = UIHostingController(
        rootView: HotelView(
            action: { [weak self] in
                self?.pushModule()
            }, 
            viewModel: viewModel
        )
    )
    init(store: HotelStore, model: Model) {
        self.store = store
        super.init(model: model)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HotelViewController {
    override func setupViews() {
        super.setupViews()
        addIgnoringSafeArea(content)
        navigationItem.title = "Отель"
        setupObservers()
        store.sendAction(.fetch)
    }

    func pushModule() {
        model.pushModuleHandler?()
    }

    private func setupObservers() {
        store
            .events
            .receive(on: DispatchQueue.main)
            .sink {[weak self] event in
                switch event {
                case .done(let hotel):
                    print(hotel)
                    self?.viewModel.hotel = hotel
                }
            }.store(in: &bag)
    }
}
