import UIKit

final class HotelViewController: BaseViewController {
    struct Model {
        let pushRoomHandler: (() -> Void)?
    }

    private let model: Model

    init(model: Model) {
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
        view.backgroundColor = .green
        addNavBarButton(at: .right, with: "Room")
        title = "Отель"
    }

    override func navBarRightButtonHandler() {
        model.pushRoomHandler?()
    }
}
