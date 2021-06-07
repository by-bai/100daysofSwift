//
//  Petition.swift
//  Project7
//
//  Created by Bai on 7/6/21.
//

import Foundation

struct Petition: Codable { //conform to the Protocol Codable
    var title: String
    var body: String
    var signatureCount: Int
}

