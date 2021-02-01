//
//  ContentView.swift
//  SampleJsonMenu
//
//  Created by Telman Rustam on 2021-01-29.
//

import SwiftUI
import swift_json_menu

struct ContentView: View {
    
    @EnvironmentObject var config : AppConfigJson
    
    var body: some View {
        let storyBoardName = "foodmenu"
        let sections = config.data.Section(forStoryboard: storyBoardName)
        
        NavigationView{
            List{
                ForEach(sections!, id: \.self){
                    section in
                    TableSectionUI(storyBoard: storyBoardName, section: section)
                    
                }
            }
            .navigationBarTitle(Text("Main Menu"), displayMode: .large)
            .listStyle(GroupedListStyle())
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
