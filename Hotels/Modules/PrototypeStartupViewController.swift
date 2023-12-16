import UIKit

protocol PrototypeStartupModuleOutput: AnyObject {
    func moduleFinish(with deeplink: PrototypeStartupCoordinator.Deeplink)
}

final class PrototypeStartupViewController: UIViewController {
    private weak var output: PrototypeStartupModuleOutput?
    private let deeplink: PrototypeStartupCoordinator.Deeplink

    init(
        output: PrototypeStartupModuleOutput,
        deeplink: PrototypeStartupCoordinator.Deeplink
    ) {
        self.output = output
        self.deeplink = deeplink
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        switch deeplink {
        case .one: proceedOne()
        case .two: proceedTwo()
        case .three: proceedThree()
        }
    }
}

private extension PrototypeStartupViewController {
    func proceedOne() {
        view.backgroundColor = .random
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.output?.moduleFinish(with: self.deeplink)
        }
    }

    func proceedTwo() {
        view.backgroundColor = .random
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.output?.moduleFinish(with: self.deeplink)
        }
    }

    func proceedThree() {
        view.backgroundColor = .random
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.output?.moduleFinish(with: self.deeplink)
        }
    }
}

extension String {
    static var randomWord: String {
        return allWords.randomElement()!.uppercasedFirst
    }

    var uppercasedFirst: String {
        if isEmpty { return "" }
        let firstIndex = index(startIndex, offsetBy: 1)
        let first = self[..<firstIndex].uppercased()
        let others = self[firstIndex...]
        return first + others
    }

    private static let allWords = [
        "alias", "consequatur", "aut", "perferendis", "sit", "voluptatem", "accusantium", "doloremque", "aperiam", "eaque", "ipsa", "quae", "ab", "illo", "inventore", "veritatis", "et", "quasi", "architecto", "beatae", "vitae", "dicta", "sunt", "explicabo", "aspernatur", "aut", "odit", "aut", "fugit", "sed", "quia", "consequuntur", "magni", "dolores", "eos", "qui", "ratione", "voluptatem", "sequi", "nesciunt", "neque", "dolorem", "ipsum", "quia", "dolor", "sit", "amet", "consectetur", "adipisci", "velit", "sed", "quia", "non", "numquam", "eius", "modi", "tempora", "incidunt", "ut", "labore", "et", "dolore", "magnam", "aliquam", "quaerat", "voluptatem", "ut", "enim", "ad", "minima", "veniam", "quis", "nostrum", "exercitationem", "ullam", "corporis", "nemo", "enim", "ipsam", "voluptatem", "quia", "voluptas", "sit", "suscipit", "laboriosam", "nisi", "ut", "aliquid", "ex", "ea", "commodi", "consequatur", "quis", "autem", "vel", "eum", "iure", "reprehenderit", "qui", "in", "ea", "voluptate", "velit", "esse", "quam", "nihil", "molestiae", "et", "iusto", "odio", "dignissimos", "ducimus", "qui", "blanditiis", "praesentium", "laudantium", "totam", "rem", "voluptatum", "deleniti", "atque", "corrupti", "quos", "dolores", "et", "quas", "molestias", "excepturi", "sint", "occaecati", "cupiditate", "non", "provident", "sed", "ut", "perspiciatis", "unde", "omnis", "iste", "natus", "error", "similique", "sunt", "in", "culpa", "qui", "officia", "deserunt", "mollitia", "animi", "id", "est", "laborum", "et", "dolorum", "fuga", "et", "harum", "quidem", "rerum", "facilis", "est", "et", "expedita", "distinctio", "nam", "libero", "tempore", "cum", "soluta", "nobis", "est", "eligendi", "optio", "cumque", "nihil", "impedit", "quo", "porro", "quisquam", "est", "qui", "minus", "id", "quod", "maxime", "placeat", "facere", "possimus", "omnis", "voluptas", "assumenda", "est", "omnis", "dolor", "repellendus", "temporibus", "autem", "quibusdam", "et", "aut", "consequatur", "vel", "illum", "qui", "dolorem", "eum", "fugiat", "quo", "voluptas", "nulla", "pariatur", "at", "vero", "eos", "et", "accusamus", "officiis", "debitis", "aut", "rerum", "necessitatibus", "saepe", "eveniet", "ut", "et", "voluptates", "repudiandae", "sint", "et", "molestiae", "non", "recusandae", "itaque", "earum", "rerum", "hic", "tenetur", "a", "sapiente", "delectus", "ut", "aut", "reiciendis", "voluptatibus", "maiores", "doloribus", "asperiores", "repellat"
    ]
}

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }

    static var customMint: UIColor {
        return .init(red: 89/255, green: 196/255, blue: 189/255, alpha: 1)
    }
}
