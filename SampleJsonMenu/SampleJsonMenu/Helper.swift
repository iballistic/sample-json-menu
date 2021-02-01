//
//  Helper.swift
//  json-menu
//
//  Created by Telman Rustam on 2021-01-29.
//

import Foundation
import swift_json_menu

public class AppConfigJson : ObservableObject{
    @Published var data : JSonMenu
    init() {
        if let path = FileSystemHelper.pathToFile(inBundle: Bundle.main.bundleIdentifier!, fileName: "menu", fileType: "json"){
            self.data = try! JSonMenu(jsonFilePath: path)
            
        }else{
            self.data = JSonMenu()
        }
    }
    
}

public struct FileSystemHelper{
    
    public static func pathToFile(inBundle: String, fileName: String, fileType: String) ->String?{
        let dbBundle = Bundle(identifier: inBundle)
        let modelURL = dbBundle!.url(forResource: fileName, withExtension: fileType)
        return modelURL?.path
    }
    
    public static func pathToFile( fileName: String, fileType: String) ->String?{
        guard let identifier = Bundle.main.bundleIdentifier else {
            return nil
        }
        
        return pathToFile(inBundle: identifier, fileName: fileName, fileType: fileType)
    }
    
    public static func getContent(fileName : String, ext: String) -> String?{
        let filePath = pathToFile(inBundle: Bundle.main.bundleIdentifier!, fileName: fileName, fileType: ext)
        
        
        if let path = filePath{
            let data = try? String(contentsOfFile: path)
            return data
        }
        return nil
        
    }
    
    public static func getContent(fileName : String) -> String?{
        //    let bundle = Bundle(identifier: Bundle.main.bundleIdentifier!)
        //    let url = bundle!.url(forResource: "menu", withExtension: "json")
        let url = Bundle.main.url(forResource: fileName, withExtension: nil)
        //url should be unwarpped before we can get path value
        if let path = url?.path{
            let data = try? String(contentsOfFile: path)
            return data
        }
        return nil
        
    }
    
    
}

