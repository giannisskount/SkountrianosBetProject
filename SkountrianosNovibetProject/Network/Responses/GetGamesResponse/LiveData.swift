//
//  LiveData.swift
//
//  Created by Ιωάννης Σκουντριάνος on 12/9/22
//  Copyright (c) . All rights reserved.
//

import Foundation

struct LiveData: Codable {

  enum CodingKeys: String, CodingKey {
    case liveStreamingCountries
    case phaseCaptionLong
    case isInterrupted
    case durationSeconds
    case isInPlay
    case homePossession
    case referenceTime
    case sportradarMatchId
    case elapsedSeconds
    case isLive
    case awayPoints
    case homePoints
    case adjustTimeMillis
    case supportsAchievements
    case elapsed
    case isInPlayPaused
    case supportsActions
    case phaseSysname
    case timeToNextPhaseSeconds
    case remainingSeconds
    case duration
    case remaining
    case referenceTimeUnix
    case phaseCaption
    case timeToNextPhase
  }

  var liveStreamingCountries: String?
  var phaseCaptionLong: String?
  var isInterrupted: Bool?
  var durationSeconds: Int?
  var isInPlay: Bool?
  var homePossession: Bool?
  var referenceTime: String?
  var sportradarMatchId: Int?
  var elapsedSeconds: Float?
  var isLive: Bool?
  var awayPoints: Int?
  var homePoints: Int?
  var adjustTimeMillis: Int?
  var supportsAchievements: Bool?
  var elapsed: String?
  var isInPlayPaused: Bool?
  var supportsActions: Bool?
  var phaseSysname: String?
  var timeToNextPhaseSeconds: Float?
  var remainingSeconds: Float?
  var duration: String?
  var remaining: String?
  var referenceTimeUnix: Int?
  var phaseCaption: String?
  var timeToNextPhase: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    liveStreamingCountries = try container.decodeIfPresent(String.self, forKey: .liveStreamingCountries)
    phaseCaptionLong = try container.decodeIfPresent(String.self, forKey: .phaseCaptionLong)
    isInterrupted = try container.decodeIfPresent(Bool.self, forKey: .isInterrupted)
    durationSeconds = try container.decodeIfPresent(Int.self, forKey: .durationSeconds)
    isInPlay = try container.decodeIfPresent(Bool.self, forKey: .isInPlay)
    homePossession = try container.decodeIfPresent(Bool.self, forKey: .homePossession)
    referenceTime = try container.decodeIfPresent(String.self, forKey: .referenceTime)
    sportradarMatchId = try container.decodeIfPresent(Int.self, forKey: .sportradarMatchId)
    elapsedSeconds = try container.decodeIfPresent(Float.self, forKey: .elapsedSeconds)
    isLive = try container.decodeIfPresent(Bool.self, forKey: .isLive)
    awayPoints = try container.decodeIfPresent(Int.self, forKey: .awayPoints)
    homePoints = try container.decodeIfPresent(Int.self, forKey: .homePoints)
    adjustTimeMillis = try container.decodeIfPresent(Int.self, forKey: .adjustTimeMillis)
    supportsAchievements = try container.decodeIfPresent(Bool.self, forKey: .supportsAchievements)
    elapsed = try container.decodeIfPresent(String.self, forKey: .elapsed)
    isInPlayPaused = try container.decodeIfPresent(Bool.self, forKey: .isInPlayPaused)
    supportsActions = try container.decodeIfPresent(Bool.self, forKey: .supportsActions)
    phaseSysname = try container.decodeIfPresent(String.self, forKey: .phaseSysname)
    timeToNextPhaseSeconds = try container.decodeIfPresent(Float.self, forKey: .timeToNextPhaseSeconds)
    remainingSeconds = try container.decodeIfPresent(Float.self, forKey: .remainingSeconds)
    duration = try container.decodeIfPresent(String.self, forKey: .duration)
    remaining = try container.decodeIfPresent(String.self, forKey: .remaining)
    referenceTimeUnix = try container.decodeIfPresent(Int.self, forKey: .referenceTimeUnix)
    phaseCaption = try container.decodeIfPresent(String.self, forKey: .phaseCaption)
    timeToNextPhase = try container.decodeIfPresent(String.self, forKey: .timeToNextPhase)
  }

}
