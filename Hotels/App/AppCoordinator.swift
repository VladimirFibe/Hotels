import Foundation

final class AppCoordinator: BaseCoordinator {
    override func start() {
        runHotel()
    }

    private func runHotel() {
        let controller = makeHotel()
        router.setRootModule(controller)
    }
    private func runRoom() {
        let controller = makeRoom()
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
        HotelViewController(model: .init(pushModuleHandler: { [weak self] in
            self?.runRoom()
        }))
    }

    private func makeRoom() -> BaseViewControllerProtocol {
        RoomViewController(model: .init(
            pushModuleHandler: { [weak self] in
                self?.runBook()
            },
            closeUnitOrModuleHandler: { [weak self] in
                self?.closeModule()
            }
        ))
    }

    private func makeReserve() -> BaseViewControllerProtocol {
        BookViewController(model: .init(
            pushModuleHandler: { [weak self] in
                self?.runPaid()
            },
            closeUnitOrModuleHandler: { [weak self] in
                self?.closeModule()
            }
        ))
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
