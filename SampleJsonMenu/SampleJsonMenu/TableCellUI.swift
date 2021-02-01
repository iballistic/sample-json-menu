//
//  ItemRow.swift
//  SampleJsonMenu
//
//  Created by Telman Rustam on 2021-01-30.
//

import SwiftUI
import swift_json_menu

struct TableCellUI: View {
    @EnvironmentObject var config : AppConfigJson
    @State private var enteredText = ""
    var cell : TableCell
    var body: some View {
        if let title = cell.title{
            VStack{
            HStack{
                Text("\(title)")
                TextField("\(title)", text: $enteredText)
               
            }
//                Text("Entered text \(enteredText) for key \(cell.key)")
            }
        }
    }
}

struct TableCellUI_Previews: PreviewProvider {
    static let cell = TableCell()
    static let config = AppConfigJson()
    
    static var previews: some View {
        TableCellUI(cell: cell).environmentObject(config)
    }
}
