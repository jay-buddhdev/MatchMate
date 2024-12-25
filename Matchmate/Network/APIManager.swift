//
//  APIManager.swift
//  Matchmate
//
//  Created by Jay Buddhdev on 25/12/24.
//
import Foundation

final class APIManager {
    
    // MARK: - Singleton Instance
    static let shared = APIManager()
    private init() {}

    // MARK: - API Request Method
    func request<T: Decodable>(
        endpoint: String,
        method: HTTPMethod = .get,
        headers: [String: String]? = nil,
        body: Data? = nil,
        responseType: T.Type
    ) async throws -> T {
        guard let url = URL(string: endpoint) else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        if let headers = headers {
            headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }
        }
        request.httpBody = body

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw APIError.invalidResponse
        }

        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw APIError.decodingError
        }
    }
}
