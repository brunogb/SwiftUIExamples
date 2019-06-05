//
//  Project.swift
//  FastIDE
//
//  Created by Bruno Bilescky on 04/06/2019.
//  Copyright © 2019 Bilescky. All rights reserved.
//

import Foundation
import SwiftUI

struct Project: Hashable {
    static func == (lhs: Project, rhs: Project) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(color)
    }
    
    var id: Int
    var name: String
    var color: Color
    var createdAt: Date = Date()
    var updatedAt: Date = Date()
    
}
