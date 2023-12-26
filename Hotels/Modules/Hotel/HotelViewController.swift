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

    struct Model {
        var pushUnitHandler: Callback? = nil
        var pushModuleHandler: ((String) -> Void)? = nil
        var closeUnitOrModuleHandler: Callback? = nil
        var popToRootHandler: Callback? = nil
        var modalModuleHandler: Callback? = nil
        var modalUnitHandler: Callback? = nil
        var closeModalHandler: Callback? = nil
    }

    let model: Model

    init(store: HotelStore, model: Model) {
        self.store = store
        self.model = model
        super.init(nibName: nil, bundle: nil)
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
        let title = viewModel.hotel?.name ?? "Hotel"
        model.pushModuleHandler?(title)
    }

    private func setupObservers() {
        store
            .events
            .receive(on: DispatchQueue.main)
            .sink {[weak self] event in
                switch event {
                case .done(let hotel):
                    self?.viewModel.hotel = hotel
                }
            }.store(in: &bag)
    }
}
