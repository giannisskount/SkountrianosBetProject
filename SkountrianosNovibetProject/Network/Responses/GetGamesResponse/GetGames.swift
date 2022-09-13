//
//  GetGames.swift
//
//  Created by Ιωάννης Σκουντριάνος on 12/9/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct GetGame: Codable {
    
    enum CodingKeys: String, CodingKey {
        case modelType
        case caption
        case marketViewKey
        case totalCount
        case betViews
        case marketViewType
        case hasHighlights
    }
    
    var modelType: String?
    var caption: String?
    var marketViewKey: String?
    var totalCount: Int?
    var betViews: [BetViews]?
    var marketViewType: String?
    var hasHighlights: Bool?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        modelType = try container.decodeIfPresent(String.self, forKey: .modelType)
        caption = try container.decodeIfPresent(String.self, forKey: .caption)
        marketViewKey = try container.decodeIfPresent(String.self, forKey: .marketViewKey)
        totalCount = try container.decodeIfPresent(Int.self, forKey: .totalCount)
        betViews = try container.decodeIfPresent([BetViews].self, forKey: .betViews)
        marketViewType = try container.decodeIfPresent(String.self, forKey: .marketViewType)
        hasHighlights = try container.decodeIfPresent(Bool.self, forKey: .hasHighlights)
    }
}
