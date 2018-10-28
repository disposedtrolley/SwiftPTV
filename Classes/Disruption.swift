//
//  Disruption.swift
//  SwiftPTViOS
//
//  Created by James Liu on 28/10/18.
//

import Foundation

public struct Disruption: Codable {
    let disruptionID: Int?
    let title: String?
    let url: String?
    let description: String?
    let disruptionStatus: String?
    let disruptionType: String?
    let publishedOn: Date?
    let lastUpdated: Date?
    let fromDate: Date?
    let toDate: Date?
    
    internal enum CodingKeys: String, CodingKey {
        case disruptionID = "disruption_id"
        case title = "title"
        case url = "url"
        case description = "description"
        case disruptionStatus = "disruption_status"
        case disruptionType = "disruption_type"
        case publishedOn = "published_on"
        case lastUpdated = "last_updated"
        case fromDate = "from_date"
        case toDate = "to_date"
    }
}

public extension Disruption {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let disruptionID = try? container.decode(Int.self, forKey: .disruptionID)
        let title = try? container.decode(String.self, forKey: .title)
        let url = try? container.decode(String.self, forKey: .url)
        let description = try? container.decode(String.self, forKey: .description)
        let disruptionStatus = try? container.decode(String.self, forKey: .disruptionStatus)
        let disruptionType = try? container.decode(String.self, forKey: .disruptionType    )
        let publishedOnString = try? container.decode(String.self, forKey: .publishedOn)
        let lastUpdatedString = try? container.decode(String.self, forKey: .lastUpdated)
        let fromDateString = try? container.decode(String.self, forKey: .fromDate)
        let toDateString = try? container.decode(String.self, forKey: .toDate)
        
        let dateFormatter = ISO8601DateFormatter()
        let publishedOn = publishedOnString != nil ? dateFormatter.date(from: publishedOnString!) : nil
        let lastUpdated = lastUpdatedString != nil ? dateFormatter.date(from: lastUpdatedString!) : nil
        let fromDate = fromDateString != nil ? dateFormatter.date(from: fromDateString!) : nil
        let toDate = toDateString != nil ? dateFormatter.date(from: toDateString!) : nil
        
        self.init(disruptionID: disruptionID, title: title, url: url, description: description, disruptionStatus: disruptionStatus, disruptionType: disruptionType, publishedOn: publishedOn, lastUpdated: lastUpdated, fromDate: fromDate, toDate: toDate)
    }
}
