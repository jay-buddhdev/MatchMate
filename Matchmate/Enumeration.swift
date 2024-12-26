//
//  Enumeration.swift
//  Matchmate
//
//  Created by Jay Buddhdev on 25/12/24.
//

// MARK: - HTTPMethod Enum
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

// MARK: - APIError Enum
enum APIError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
    case customError(String)
}
