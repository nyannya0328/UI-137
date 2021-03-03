//
//  UI_137App.swift
//  UI-137
//
//  Created by にゃんにゃん丸 on 2021/03/03.
//

import SwiftUI

@main
struct UI_137App: App {
    @StateObject var model = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
