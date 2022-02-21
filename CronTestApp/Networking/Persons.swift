//
//  Persons.swift
//  CronTestApp
//
//  Created by Jafar on 21.02.2022.
//

import Foundation

struct Persons: Decodable {
  let error: Int
  let all: [Person]
  
  enum CodingKeys: String, CodingKey {
    case error
    case all = "data"
  }
}
