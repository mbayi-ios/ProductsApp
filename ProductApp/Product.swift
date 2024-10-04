struct Product: Codable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let images: [String]
    let thumbnail: String
}
