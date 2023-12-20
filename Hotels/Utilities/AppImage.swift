import SwiftUI

protocol AppImageProtocol {
    var rawValue: String { get }
}

extension AppImageProtocol {
    var image: Image {
        Image(rawValue)
    }

    var uiImage: UIImage? {
        guard let image = UIImage(named: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }

    var systemImage: UIImage? {
        guard let image = UIImage(systemName: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }
}

enum AppImage: String, AppImageProtocol {
    case closeSquare
    case emojiHappy
    case tickSquare
}
