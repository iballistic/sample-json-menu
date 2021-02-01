//
//  TableSectionView.swift
//  SampleJsonMenu
//
//  Created by Telman Rustam on 2021-01-30.
//

import SwiftUI
import swift_json_menu

struct TableSectionUI: View {
    @EnvironmentObject var config : AppConfigJson
    var storyBoard : String
    var section: TableSection
    
    
    
    var body: some View {
        Section(header: Text(section.header ?? section.name)){
            if let view = config.data.View(forStoryboard: storyBoard, forSection: section.name){
                ForEach(view,  id: \.self){
                    item in
                    TableCellUI(cell: item.cell!)
                }
            }
        }
    }
}

struct TableSectionUI_Previews: PreviewProvider {
    static let config = AppConfigJson()
    static let storyBoard = "test"
    static let section  = TableSection(name: "test", header: "header1", footer: "footer1", order :10 )
    
    static var previews: some View {
        TableSectionUI(storyBoard: storyBoard, section: section).environmentObject(config)
    }
}
