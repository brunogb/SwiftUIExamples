//
//  ProjectListRow.swift
//  FastIDE
//
//  Created by Bruno Bilescky on 04/06/2019.
//  Copyright © 2019 Bilescky. All rights reserved.
//

import SwiftUI

struct ProjectListRow : View {
    var project: Project
    
    var body: some View {
        NavigationButton(destination: ProjectDetails(project: project)) {
            HStack(spacing: 40) {
                project.color
                    .frame(width: 400)
                VStack(alignment: .leading) {
                    Spacer(minLength: 40)
                    Image(systemName: "gift.fill")
                        .font(.largeTitle)
                        .foregroundColor(project.color)
                    Spacer(minLength: 40)
                    Text(project.name)
                        .font(.title)
                    Spacer()
                    HStack {
                        Image(systemName: "clock")
                            .font(.footnote)
                        Text("updated today")
                            .font(.footnote)
                    }
                    HStack {
                        Image(systemName: "calendar")
                            .font(.footnote)
                        Text("created on 10/01/2019")
                            .font(.footnote)
                    }
                    Spacer(minLength: 40)
                }
                Spacer()
            }
        }
        .overlay(
            Image(systemName: "star")
            .padding([.top], 10),
                 alignment: .topTrailing)
    }
}
