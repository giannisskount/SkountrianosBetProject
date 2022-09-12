//
//  BetViews.swift
//
//  Created by Ιωάννης Σκουντριάνος on 12/9/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct BetViews: Codable {

  enum CodingKeys: String, CodingKey {
    case totalCount
    case competitionContextCaption
    case betViewKey
    case modelType
    case competitions
    case marketCaptions
  }

  var totalCount: Int?
  var competitionContextCaption: String?
  var betViewKey: String?
  var modelType: String?
  var competitions: [Competitions]?
  var marketCaptions: [MarketCaptions]?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    totalCount = try container.decodeIfPresent(Int.self, forKey: .totalCount)
    competitionContextCaption = try container.decodeIfPresent(String.self, forKey: .competitionContextCaption)
    betViewKey = try container.decodeIfPresent(String.self, forKey: .betViewKey)
    modelType = try container.decodeIfPresent(String.self, forKey: .modelType)
    competitions = try container.decodeIfPresent([Competitions].self, forKey: .competitions)
    marketCaptions = try container.decodeIfPresent([MarketCaptions].self, forKey: .marketCaptions)
  }

}
