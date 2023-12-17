import Foundation

final class HotelCoordinator: BaseCoordinator {
    private let moduleFactory: ModuleFactoryProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol

    init(
        router: Routable,
        parent: BaseCoordinator,
        moduleFactory: ModuleFactoryProtocol,
        coordinatorFactory: CoordinatorFactoryProtocol
    ) {
        self.moduleFactory = moduleFactory
        self.coordinatorFactory = coordinatorFactory
        super.init(router: router, parent: parent)
    }
}

extension HotelCoordinator: Coordinator {
    func start(with option: Void) {
        showInitial()
    }
}

extension HotelCoordinator {
    func showInitial() {
        weak var wSelf = self
        let module = moduleFactory.makeHotelModule(pushRoomHandler: {
            wSelf?.showRoom()
        })
        router.setRootModule(module, transition: nil)
    }

    func showRoom() {
        let module = moduleFactory.makeRoomModule()
        router.pushModule(module)
    }
}
