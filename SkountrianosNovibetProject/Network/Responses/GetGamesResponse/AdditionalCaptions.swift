//
//  AdditionalCaptions.swift
//
//  Created by Ιωάννης Σκουντριάνος on 12/9/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct AdditionalCaptions: Codable {

  enum CodingKeys: String, CodingKey {
    case competitor1ImageId
    case competitor2ImageId
    case competitor1
    case competitor2
    case type
  }

  var competitor1ImageId: Int?
  var competitor2ImageId: Int?
  var competitor1: String?
  var competitor2: String?
  var type: Int?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    competitor1ImageId = try container.decodeIfPresent(Int.self, forKey: .competitor1ImageId)
    competitor2ImageId = try container.decodeIfPresent(Int.self, forKey: .competitor2ImageId)
    competitor1 = try container.decodeIfPresent(String.self, forKey: .competitor1)
    competitor2 = try container.decodeIfPresent(String.self, forKey: .competitor2)
    type = try container.decodeIfPresent(Int.self, forKey: .type)
  }

}
