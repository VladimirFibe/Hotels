import Foundation

final class AppCoordinator: BaseCoordinator {
    override func start() {
        runHotel()
    }

    private func runHotel() {
        let controller = makeHotel()
        router.setRootModule(controller)
    }
    private func runRoom(title: String) {
        let controller = makeRoom(title: title)
        router.push(controller)
    }

    private func runBook() {
        let controller = makeReserve()
        router.push(controller)
    }

    private func runPaid() {
        let controller = makePaid()
        router.push(controller)
    }

    private func runToRoot() {
        router.popToRootModule(animated: true)
    }

    private func closeModule() {
        router.popModule(animated: true)
    }
}

extension AppCoordinator {
    private func makeHotel() -> BaseViewControllerProtocol {
        let useCase = HotelUseCase(apiService: RESTClient.shared)
        let store = HotelStore(useCase: useCase)
        return HotelViewController(
            store: store,
            model: .init(
                pushModuleHandler: { [weak self] title in
                    self?.runRoom(title: title)
                }
            )
        )
    }

    private func makeRoom(title: String) -> BaseViewControllerProtocol {
        let useCase = RoomUseCase(apiService: RESTClient.shared)
        let store = RoomStore(useCase: useCase)
        return RoomViewController(
            store: store,
            model: .init(
                pushModuleHandler: { [weak self] in
                    self?.runBook()
                },
                closeUnitOrModuleHandler: { [weak self] in
                    self?.closeModule()
                }
            ), 
            title: title
        )
    }

    private func makeReserve() -> BaseViewControllerProtocol {
        let useCase = BookUseCase(apiService: RESTClient.shared)
        let store = BookStore(useCase: useCase)
        return BookViewController(
            store: store,
            model: .init(
                pushModuleHandler: { [weak self] in
                    self?.runPaid()
                },
                closeUnitOrModuleHandler: { [weak self] in
                    self?.closeModule()
                }
            )
        )
    }

    private func makePaid() -> BaseViewControllerProtocol {
        PaidViewController(model: .init(
            closeUnitOrModuleHandler: { [weak self] in
                self?.closeModule()
            },
            popToRootHandler: { [weak self] in
                self?.runToRoot()
            }
            
        ))
    }
}
