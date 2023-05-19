//
//  NewsService.swift
//  
//
//  Created by Enes İşler on 16.05.2023.
//

import Foundation
import Alamofire

public protocol TopStoriesNewsServiceProtocol: AnyObject {
    func fetchTopStories(completion: @escaping(Result<[News], Error>) -> Void)
}

public class TopStoriesNewsService: TopStoriesNewsServiceProtocol{
    
    public init() {}
    
    public func fetchTopStories(completion: @escaping(Result<[News], Error>) -> Void) {
        let urlString = "https://api.nytimes.com/svc/topstories/v2/home.json?api-key=G1Rm6R3HMkVEVskL8eO1gFrWdr9jYwtA"
        AF.request(urlString).responseData { response in
            switch response.result {
                
            case .success(let data):
                let decoder = Decoders.dateDecoder
                
                do {
                    let response = try decoder.decode(TopStoriesResponse.self, from: data)
                    completion(.success(response.results))
                }catch {
                    print("******** JSON DECODE ERROR *********")
                }
            case .failure(let error):
                completion(.failure(error))
                print("***** Hata Olustu: \(error.localizedDescription) ******")
                
            }
        }
    }
}
