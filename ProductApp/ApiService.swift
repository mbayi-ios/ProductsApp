import Foundation

class ApiService {
    func fetchProducts(completion: @escaping ([Product]) -> Void) {
        guard let url = URL(string: "https://dummyjson.com/products") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let productResponse = try JSONDecoder().decode(ProductResponse.self, from: data)
                    completion(productResponse.products)
                } catch {
                    print("Failed to decode JSON: \(error)")
                }
            }
        }.resume()
    }
}
