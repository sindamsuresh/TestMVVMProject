//
//  DataModel.swift
//  TestMVVMProject
//
//  Created by Suresh Sindam on 1/2/24.
//

import Foundation

struct DataModel: Codable {
    let articles: [Articles]
}


struct Articles: Codable {
    let title: String
}
