//
//  News.swift
//  
//
//  Created by Enes İşler on 16.05.2023.
//

import Foundation
import Alamofire


public struct NewsResult: Codable {
    let results: [News]?

}

public struct News: Codable {
    public let title, abstract: String?
    public let url: String?
    public let byline: String?
    public let multimedia: [Multimedia]?


    enum CodingKeys: String, CodingKey {
        case title, abstract, url, byline
        case multimedia
    }
}

public struct Multimedia: Codable {
    public let url: String?
}



