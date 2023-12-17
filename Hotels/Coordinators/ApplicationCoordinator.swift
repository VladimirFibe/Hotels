/// Координатор приложения
final class ApplicationCoordinator: BaseCoordinator {
    private let coordinatorFactory: CoordinatorFactoryProtocol

    init(
        router: Routable,
        coordinatorFactory: CoordinatorFactoryProtocol
    ) {
        self.coordinatorFactory = coordinatorFactory
        super.init(router: router)
    }
}

extension ApplicationCoordinator: Coordinator {
    func start(with option: Void) {
        startHotel()
    }
}

extension ApplicationCoordinator: PrototypeStartupCoordinatorOutput {
    func startupFinish(deeplink: PrototypeStartupCoordinator.Deeplink) {
        switch deeplink {
        case .one: startStartupTwo()
        case .two: startStartupThree()
        case .three: startTabBarCoordinator()
        }
    }
}

// MARK: - Navigation

private extension ApplicationCoordinator {
    func startHotel() {
        let coordinator = coordinatorFactory.makeHotelCoordinator(router: router, parent: self)
        coordinator.start()
    }
    func startStartupOne() {
        let coordinator = coordinatorFactory.makePrototypeStartupCoordinator(output: self, router: router)
        coordinator.start(with: .one)
    }

    func startStartupTwo() {
        let coordinator = coordinatorFactory.makePrototypeStartupCoordinator(output: self, router: router)
        coordinator.start(with: .two)
    }

    func startStartupThree() {
        let coordinator = coordinatorFactory.makePrototypeStartupCoordinator(output: self, router: router)
        coordinator.start(with: .three)
    }

    func startTabBarCoordinator() {
        let coordinator = coordinatorFactory.makeTabBarCoordinator(router: router, parent: self)
        coordinator.start(with: .initial)
    }
}
