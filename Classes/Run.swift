//
//  Run.swift
//  SwiftPTViOS
//
//  Created by James Liu on 28/10/18.
//

import Foundation

public struct Run: Codable {
    let runID: Int?
    let routeID: Int?
    let routeType: Int?
    let finalStopID: Int?
    let destinationName: String?
    let directionID: Int?
    let vehicleDescriptor: VehicleDescriptor?
    
    internal enum CodingKeys: String, CodingKey {
        case runID = "run_id"
        case routeID = "route_id"
        case routeType = "route_type"
        case finalStopID = "final_stop_id"
        case destinationName = "destination_name"
        case directionID = "direction_id"
        case vehicleDescriptor = "vehicle_descriptor"
    }
}

public struct VehicleDescriptor: Codable {
    let vehicleOperator: String?
    let id: String?
    let description: String?
    let supplier: String?
    
    internal enum CodingKeys: String, CodingKey {
        case vehicleOperator = "operator"
        case id
        case description, supplier
    }
}

public extension VehicleDescriptor {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let vehicleOperator = try? container.decode(String.self, forKey: .vehicleOperator)
        let id = try? container.decode(String.self, forKey: .id)
        let description = try? container.decode(String.self, forKey: .description)
        let supplier = try? container.decode(String.self, forKey: .supplier)
        
        
        self.init(vehicleOperator: vehicleOperator, id: id, description: description, supplier: supplier)
    }
}

public extension Run {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let runID = try? container.decode(Int.self, forKey: .runID)
        let routeID = try? container.decode(Int.self, forKey: .routeID)
        let routeType = try? container.decode(Int.self, forKey: .routeType)
        let finalStopID = try? container.decode(Int.self, forKey: .finalStopID)
        let destinationName = try? container.decode(String.self, forKey: .destinationName)
        let directionID = try? container.decode(Int.self, forKey: .directionID)
        let vehicleDescriptor = try? container.decode(VehicleDescriptor.self, forKey: .vehicleDescriptor)
        
        self.init(runID: runID, routeID: routeID, routeType: routeType, finalStopID: finalStopID, destinationName: destinationName, directionID: directionID, vehicleDescriptor: vehicleDescriptor)
    }
}

