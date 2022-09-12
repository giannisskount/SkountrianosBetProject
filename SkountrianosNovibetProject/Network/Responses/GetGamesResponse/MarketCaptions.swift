 //
//  MarketCaptions.swift
//
//  Created by Ιωάννης Σκουντριάνος on 12/9/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct MarketCaptions: Codable {

  enum CodingKeys: String, CodingKey {
    case marketCaption
    case betTypeSysname
  }

  var marketCaption: String?
  var betTypeSysname: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    marketCaption = try container.decodeIfPresent(String.self, forKey: .marketCaption)
    betTypeSysname = try container.decodeIfPresent(String.self, forKey: .betTypeSysname)
  }

}
