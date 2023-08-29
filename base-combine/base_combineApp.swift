//
//  base_combineApp.swift
//  base-combine
//
//  Created by Thân Văn Thanh on 28/08/2023.
//

import SwiftUI

@main
struct base_combineApp: App {
    var body: some Scene {
        WindowGroup {
            SearchView(viewModel: .init())
        }
    }
}
