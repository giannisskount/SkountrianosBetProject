////
////  GetGamesResponse.swift
////  SkountrianosNovibetProject
////
////  Created by Ιωάννης Σκουντριάνος on 11/9/22.
////
//
//import Foundation
//
//struct GetGame: Codable {
//    var betViews: [BetView]?
//    var hasHighlights: Bool?
//    var totalCount: Int?
//    var caption, marketViewType, marketViewKey, modelType: String?
//}
//
//// MARK: - BetView
//struct BetView: Codable {
//    var competitionContextCaption: String?
//    var competitions: [Competition]?
//    var totalCount: Int?
//    var marketCaptions: [MarketCaption]?
//    var betViewKey, modelType: String?
//}
//
//// MARK: - Competition
//struct Competition: Codable {
//    var betContextID: Int?
//    var caption, regionCaption: String?
//    var events: [Event]?
//
//    enum CodingKeys: String, CodingKey {
//        case betContextID
//        case caption, regionCaption, events
//    }
//}
//
//// MARK: - Event
//struct Event: Codable {
//    var betContextID: Int?
//    var path: String?
//    var isHighlighted: Bool?
//    var additionalCaptions: AdditionalCaptions?
//    var liveData: LiveData?
//    var markets: [Market]?
//    var hasBetContextInfo: Bool?
//
//    enum CodingKeys: String, CodingKey {
//        case betContextID
//        case path, isHighlighted, additionalCaptions, liveData, markets, hasBetContextInfo
//    }
//}
//
//// MARK: - AdditionalCaptions
//struct AdditionalCaptions: Codable {
//    var type: Int?
//    var competitor1: String?
//    var competitor1ImageID: Int?
//    var competitor2: String?
//    var competitor2ImageID: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case type, competitor1
//        case competitor1ImageID
//        case competitor2
//        case competitor2ImageID
//    }
//}
//
//// MARK: - LiveData
//struct LiveData: Codable {
//    var homeGoals, awayGoals, homeCorners, awayCorners: Int?
//    var homeYellowCards, awayYellowCards, homeRedCards, awayRedCards: Int?
//    var homePenaltyKicks, awayPenaltyKicks: Int?
//    var supportsAchievements: Bool?
//    var liveStreamingCountries: String?
//    var sportradarMatchID: Int?
//    var referenceTime: Date?
//    var referenceTimeUnix: Int?
//    var elapsed: String?
//    var elapsedSeconds: Double?
//    var duration, durationSeconds: JSONNull?
//    var timeToNextPhase: String?
//    var timeToNextPhaseSeconds: Double?
//    var phaseSysname: PhaseSysname?
//    var phaseCaption: PhaseCaption?
//    var phaseCaptionLong: PhaseCaptionLong?
//    var isLive, isInPlay, isInPlayPaused, isInterrupted: Bool?
//    var supportsActions: Bool?
//    var timeline: JSONNull?
//    var adjustTimeMillis: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case homeGoals, awayGoals, homeCorners, awayCorners, homeYellowCards, awayYellowCards, homeRedCards, awayRedCards, homePenaltyKicks, awayPenaltyKicks, supportsAchievements, liveStreamingCountries
//        case sportradarMatchID
//        case referenceTime, referenceTimeUnix, elapsed, elapsedSeconds, duration, durationSeconds, timeToNextPhase, timeToNextPhaseSeconds, phaseSysname, phaseCaption, phaseCaptionLong, isLive, isInPlay, isInPlayPaused, isInterrupted, supportsActions, timeline, adjustTimeMillis
//    }
//}
//
//enum PhaseCaption: String, Codable {
//    case the4500 = "45:00"
//    case αΗμ = "Α' Ημ"
//    case βΗμ = "Β' Ημ"
//}
//
//enum PhaseCaptionLong: String, Codable {
//    case the1OΗμίχρονο = "1o Ημίχρονο"
//    case the2OΗμίχρονο = "2o Ημίχρονο"
//    case ημίχρονο = "Ημίχρονο"
//}
//
//enum PhaseSysname: String, Codable {
//    case soccerMatchFirstHalf = "SOCCER_MATCH_FIRST_HALF"
//    case soccerMatchSecondHalf = "SOCCER_MATCH_SECOND_HALF"
//}
//
//// MARK: - Market
//struct Market: Codable {
//    var marketID: Int?
//    var betTypeSysname: String?
//    var betItems: [BetItem]?
//
//    enum CodingKeys: String, CodingKey {
//        case marketID
//        case betTypeSysname, betItems
//    }
//}
//
//// MARK: - BetItem
//struct BetItem: Codable {
//    var id: Int?
//    var code, caption: String?
//    var instanceCaption: JSONNull?
//    var price: Double?
//    var oddsText: String?
//    var isAvailable: Bool?
//}
//
//// MARK: - MarketCaption
//struct MarketCaption: Codable {
//    var betTypeSysname, marketCaption: String?
//    var betCaptions: JSONNull?
//}
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
