//
//  HeadLinesResponse.swift
//  SkountrianosNovibetProject
//
//  Created by Ιωάννης Σκουντριάνος on 10/9/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let headLineResponse = try? newJSONDecoder().decode(HeadLineResponse.self, from: jsonData)

import Foundation

// MARK: - HeadLineResponse
struct HeadLineResponse: Codable {
    var betViews: [HeadLineResponseBetView]?
    var caption, marketViewType, marketViewKey, modelType: String?
}

// MARK: - BetView
struct HeadLineResponseBetView: Codable {
    var betViewKey, modelType: String?
    var betContextID, marketViewGroupID, marketViewID, rootMarketViewGroupID: Int?
    var path, startTime, competitor1Caption, competitor2Caption: String?
    var betItems: [HeadLineResponseBetItem]?
    var liveData: HeadLineResponseLiveData?
    var displayFormat, text: String?
    var imageID: Int?

    enum CodingKeys: String, CodingKey {
        case betViewKey, modelType
        case betContextID
        case marketViewGroupID
        case marketViewID
        case rootMarketViewGroupID
        case path, startTime, competitor1Caption, competitor2Caption, betItems, liveData, displayFormat, text
        case imageID
    }
}

// MARK: - BetItem
struct HeadLineResponseBetItem: Codable {
    var id: Int?
    var code, caption, instanceCaption: String?
    var price: Double?
    var oddsText: String?
    var isAvailable: Bool?
}

// MARK: - LiveData
struct HeadLineResponseLiveData: Codable {
    var remaining: String?
    var remainingSeconds: Double?
    var homePoints, awayPoints: Int?
    var quarterScores: [QuarterScore]?
    var homePossession, supportsAchievements: Bool?
    var liveStreamingCountries: String?
    var sportradarMatchID: Int?
    var referenceTime: Date?
    var referenceTimeUnix: Int?
    var elapsed: String?
    var elapsedSeconds: Double?
    var duration: String?
    var durationSeconds: Int?
    var phaseSysname, phaseCaption, phaseCaptionLong: String?
    var isLive, isInPlay, isInPlayPaused, isInterrupted: Bool?
    var supportsActions: Bool?
    var adjustTimeMillis: Int?

    enum CodingKeys: String, CodingKey {
        case remaining, remainingSeconds, homePoints, awayPoints, quarterScores, homePossession, supportsAchievements, liveStreamingCountries
        case sportradarMatchID
        case referenceTime, referenceTimeUnix, elapsed, elapsedSeconds, duration, durationSeconds, phaseSysname, phaseCaption, phaseCaptionLong, isLive, isInPlay, isInPlayPaused, isInterrupted, supportsActions, adjustTimeMillis
    }
}

// MARK: - QuarterScore
struct QuarterScore: Codable {
    var caption: String?
    var homeScore, awayScore: Int?
}
