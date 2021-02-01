//
//  TableSectionView.swift
//  SampleJsonMenu
//
//  Created by Telman Rustam on 2021-01-30.
//

import SwiftUI
import swift_json_menu

struct TableSectionUI: View {
    var jsonMenu : JSonMenu
    var storyBoard : String
    var section: TableSection
    
    
    
    var body: some View {
        Section(header: Text(section.header ?? section.name)){
            if let view = jsonMenu.View(forStoryboard: storyBoard, forSection: section.name){
                ForEach(view,  id: \.self){
                    item in
                    TableCellUI(cell: item.cell!)
                }
            }
        }
    }
}

struct TableSectionUI_Previews: PreviewProvider {
    static let jsonMenu = JSonMenu()
    static let storyBoard = "test"
    static let section  = TableSection(name: "test", header: "header1", footer: "footer1", order :10 )
    
    static var previews: some View {
        TableSectionUI(jsonMenu: jsonMenu, storyBoard: storyBoard, section: section)
    }
}
