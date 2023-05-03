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
                        .keyboardType(cellKeyboardType(cell: cell))
                    
                    /*formatter
                    A formatter to use when converting between the string the user edits and the underlying value of type V. If formatter can’t perform the conversion, the text field doesn’t modify binding.value.
                     */
                    
                }
                
                Text("Entered text \(enteredText) for key \(cell.key)")
            }
        }
    }
}

extension TableCellUI{
    
    func cellKeyboardType(cell: TableCell) -> UIKeyboardType{
        var keyboard : UIKeyboardType = .default
        
        if let cellType = cell.celltype{
            
            switch cellType {
            case .CellInt:
                keyboard = .numberPad
            case .CellDouble:
                keyboard = .decimalPad
            case .CellString:
                keyboard = .default
            default:
                keyboard = .default
            }
        }
        return keyboard
    }
    
//    func cellFormatter (cell: TableCell) ->Formatter{
//
//        let format = NumberFormatter()
//        format.numberStyle = .decimal
//
//        return format
//    }
}


struct TableCellUI_Previews: PreviewProvider {
    static let cell = TableCell()
    static let config = AppConfigJson()
    
    static var previews: some View {
        TableCellUI(cell: cell).environmentObject(config)
    }
}
