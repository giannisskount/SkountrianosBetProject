//
//  Competitions.swift
//
//  Created by Ιωάννης Σκουντριάνος on 12/9/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Competitions: Codable {

  enum CodingKeys: String, CodingKey {
    case events
    case caption
    case regionCaption
    case betContextId
  }

  var events: [Events]?
  var caption: String?
  var regionCaption: String?
  var betContextId: Int?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    events = try container.decodeIfPresent([Events].self, forKey: .events)
    caption = try container.decodeIfPresent(String.self, forKey: .caption)
    regionCaption = try container.decodeIfPresent(String.self, forKey: .regionCaption)
    betContextId = try container.decodeIfPresent(Int.self, forKey: .betContextId)
  }

}
