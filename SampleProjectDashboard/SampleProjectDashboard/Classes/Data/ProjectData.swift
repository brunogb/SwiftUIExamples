//
//  ProjectData.swift
//  FastIDE
//
//  Created by Bruno Bilescky on 05/06/2019.
//  Copyright © 2019 Bilescky. All rights reserved.
//

import Combine
import SwiftUI

class ProjectData: BindableObject {

    private var index: Int { projects.count }
    private let colors: [Color] = [.blue, .red, .green, .orange, .yellow, .purple, .gray, .pink]
    
    let didChange = PassthroughSubject<ProjectData, Never>()

    var projects: [Project] {
        didSet {
            didChange.send(self)
        }
    }
    
    init() {
        self.projects = []
        let numberOfRandomProjects = Int.random(in: 1..<10)
        for _ in 0...numberOfRandomProjects {
            self.insertRandomProject()
        }
    }
    
    func insertRandomProject() {
        let faker = Faker(locale: "en_GB")
        let color = colors.randomElement()!
        let project = Project(id: index, name: faker.company.name(), color: color)
        self.projects.insert(project, at: 0)
    }
    
}
