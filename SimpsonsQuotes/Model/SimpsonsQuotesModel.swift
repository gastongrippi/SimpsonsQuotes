//
//  SimpsonsQuotesModel.swift
//  SimpsonsQuotes
//
//  Created by gaston on 6/29/19.
//  Copyright © 2019 gaston. All rights reserved.
//

import Foundation

struct SimpsonQuote : Codable {
    var quote: String
    var character: String
    var image: String
    var direction: String
    
    enum CodingKeys: String, CodingKey {
        case quote
        case character
        case image
        case direction = "characterDirection"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        quote = try values.decode(String.self, forKey: .quote)
        character = try values.decode(String.self, forKey: .character)
        image = try values.decode(String.self, forKey: .image)
        direction = try values.decode(String.self, forKey: .direction)
    }
}
