//
//  ContentView.swift
//  SampleJsonMenu
//
//  Created by Telman Rustam on 2021-01-29.
//

import SwiftUI
import swift_json_menu

struct ContentView: View {
    
    let data = FileSystemHelper.fileToJSON(fileName: "menu", fileType: "json")
    
    var body: some View {
        let storyBoardName = "reloaddata"
        let jsonMenu = JSonMenu(collection: data!)
        let sections = jsonMenu.Section(forStoryboard: storyBoardName)
        
        NavigationView{
            List{
                ForEach(sections!, id: \.self){
                    section in
                    TableSectionUI(jsonMenu: jsonMenu, storyBoard: storyBoardName, section: section)
                    
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
