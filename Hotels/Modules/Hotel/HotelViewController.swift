import SwiftUI

final class HotelViewController: BaseViewController {
    private let useCase = HotelUseCase(apiService: RESTClient.shared)
    private lazy var store = HotelStore(useCase: useCase)
    private var viewModel = HotelViewModel()
    private lazy var content = UIHostingController(
        rootView: HotelView(action: { [weak self] in
            self?.pushModule()
        }, viewModel: viewModel)
    )

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
                    self?.viewModel.hotel = hotel
                }
            }.store(in: &bag)
    }
}
