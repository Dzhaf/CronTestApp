//
//  Person.swift
//  CronTestApp
//
//  Created by Jafar on 21.02.2022.
//

import Foundation


struct Person: Decodable {
    let id: Int
    let fio: String
    let sex: String
    let post: String
    let company: String
    let actualCompany: Int
    let activity: String
    let photo: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case fio
        case sex
        case post
        case company
        case actualCompany = "actual_company"
        case activity
        case photo
    }
}

extension Person: Displayable {
    var personPhoto: String {
        photo
    }
    
    var personNameLabel: String {
        fio
    }
    
    var personCompany: String {
        "  \(String(company))"
    }
    
    var personPostLabel: (label: String, value: String) {
        ("Post", post)
    }
    
    var companyActivityLabel: (label: String, value: String) {
        ("Activity", activity)
    }
 
    
    
}

