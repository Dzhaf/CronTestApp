//
//  Displayable.swift
//  CronTestApp
//
//  Created by Jafar on 21.02.2022.
//

import Foundation
import UIKit

protocol Displayable {
    var personPhoto: String {get}
    var personNameLabel: String { get }
    var personCompany: String { get }
    var personPostLabel: (label: String, value: String) { get }
    var companyActivityLabel: (label: String, value: String) { get }
   
}
