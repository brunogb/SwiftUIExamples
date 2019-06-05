//
//  ProjectWizard.swift
//  FastIDE
//
//  Created by Bruno Bilescky on 05/06/2019.
//  Copyright © 2019 Bilescky. All rights reserved.
//

import SwiftUI

struct ProjectWizard : View {
    var body: some View {
        VStack {
            Image(systemName: "plus.circle.fill")
                .font(.largeTitle)
        }
        .background(Color.white)
    }
}

#if DEBUG
struct ProjectWizard_Previews : PreviewProvider {
    static var previews: some View {
        ProjectWizard()
    }
}
#endif
