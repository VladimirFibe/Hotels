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
        startTabBarCoordinator()
    }
}

private extension ApplicationCoordinator {
    func startTabBarCoordinator() {
        let coordinator = coordinatorFactory.makeTabBarCoordinator(router: router, parent: self)
        coordinator.start(with: .initial)
    }
}
