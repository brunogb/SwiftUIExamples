//
//  ProjectDetails.swift
//  FastIDE
//
//  Created by Bruno Bilescky on 05/06/2019.
//  Copyright © 2019 Bilescky. All rights reserved.
//

import SwiftUI

struct ProjectDetails : View {
    
    var project: Project
    
    var body: some View {
        Text(project.name)
    }
}

