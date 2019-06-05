//
//  ProjectListView.swift
//  FastIDE
//
//  Created by Bruno Bilescky on 04/06/2019.
//  Copyright © 2019 Bilescky. All rights reserved.
//

import SwiftUI

struct ProjectList : View {
    
    @EnvironmentObject private var projectData: ProjectData
    
    var wizard: ProjectWizard { ProjectWizard() }
    
    var body: some View {
        NavigationView {
            List(projectData.projects.identified(by: \.id)) { project in
                ProjectListRow(project: project)
            }
            .navigationBarTitle(Text("Projects"))
            .navigationBarItems(trailing:
                HStack(spacing: 20) {
                    Button(action: {
                        self.projectData.insertRandomProject()
                    }) {
                        Image(systemName: "plus")
                            .font(.title)
                    }
                    PresentationButton(
                        Image(systemName: "person.crop.square")
                            .font(.title),
                        destination: ProjectWizard()
                    )
                }
            )
        }
    }
}

#if DEBUG
struct ProjectListView_Previews : PreviewProvider {
    static var previews: some View {
        ProjectList()
    }
}
#endif
