import UIKit

extension UIViewController {
    public func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func addIgnoringSafeArea(_ bridgedView: UIViewController) {
        add(bridgedView)
        bridgedView.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bridgedView.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            bridgedView.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            bridgedView.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            bridgedView.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
}
