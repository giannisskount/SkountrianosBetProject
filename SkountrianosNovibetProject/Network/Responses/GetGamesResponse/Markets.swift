//
//  Markets.swift
//
//  Created by Ιωάννης Σκουντριάνος on 12/9/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Markets: Codable {

  enum CodingKeys: String, CodingKey {
    case betItems
    case marketId
    case betTypeSysname
  }

  var betItems: [BetItems]?
  var marketId: Int?
  var betTypeSysname: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    betItems = try container.decodeIfPresent([BetItems].self, forKey: .betItems)
    marketId = try container.decodeIfPresent(Int.self, forKey: .marketId)
    betTypeSysname = try container.decodeIfPresent(String.self, forKey: .betTypeSysname)
  }

}
