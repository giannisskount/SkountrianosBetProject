//
//  Events.swift
//
//  Created by Ιωάννης Σκουντριάνος on 12/9/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Events: Codable {

  enum CodingKeys: String, CodingKey {
    case hasBetContextInfo
    case betContextId
    case markets
    case liveData
    case path
    case isHighlighted
    case additionalCaptions
  }

  var hasBetContextInfo: Bool?
  var betContextId: Int?
  var markets: [Markets]?
  var liveData: LiveData?
  var path: String?
  var isHighlighted: Bool?
  var additionalCaptions: AdditionalCaptions?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    hasBetContextInfo = try container.decodeIfPresent(Bool.self, forKey: .hasBetContextInfo)
    betContextId = try container.decodeIfPresent(Int.self, forKey: .betContextId)
    markets = try container.decodeIfPresent([Markets].self, forKey: .markets)
    liveData = try container.decodeIfPresent(LiveData.self, forKey: .liveData)
    path = try container.decodeIfPresent(String.self, forKey: .path)
    isHighlighted = try container.decodeIfPresent(Bool.self, forKey: .isHighlighted)
    additionalCaptions = try container.decodeIfPresent(AdditionalCaptions.self, forKey: .additionalCaptions)
  }

}
