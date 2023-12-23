import Foundation

typealias Parameters = [String: Any]

final class RESTClient {
    static let shared = RESTClient()
    private init() {}

    func request<Response: Decodable>(_ route: RESTRoute) async throws -> Response {
        guard let url = route.url else { throw RESTError.invalidURL }
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let result = try? JSONDecoder().decode(Response.self, from: data)
        else { throw RESTError.invalidData }
        return result
    }
}
