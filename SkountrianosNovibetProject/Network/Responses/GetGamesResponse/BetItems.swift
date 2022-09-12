//
//  BetItems.swift
//
//  Created by Ιωάννης Σκουντριάνος on 12/9/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct BetItems: Codable {

  enum CodingKeys: String, CodingKey {
    case caption
    case code
    case oddsText
    case id
    case instanceCaption
    case isAvailable
    case price
  }

  var caption: String?
  var code: String?
  var oddsText: String?
  var id: Int?
  var instanceCaption: String?
  var isAvailable: Bool?
  var price: Float?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    caption = try container.decodeIfPresent(String.self, forKey: .caption)
    code = try container.decodeIfPresent(String.self, forKey: .code)
    oddsText = try container.decodeIfPresent(String.self, forKey: .oddsText)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    instanceCaption = try container.decodeIfPresent(String.self, forKey: .instanceCaption)
    isAvailable = try container.decodeIfPresent(Bool.self, forKey: .isAvailable)
    price = try container.decodeIfPresent(Float.self, forKey: .price)
  }

}
