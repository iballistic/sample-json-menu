//
//  Helper.swift
//  json-menu
//
//  Created by Telman Rustam on 2021-01-29.
//

import Foundation

public struct FileSystemHelper{
    
    public static func fileToJSON(fileName : String, fileType: String) -> [String:Any]?{
        let filePath =  pathToFile(fileName: fileName, fileType: fileType)
        if let path = filePath {
            return FileSystemHelper.fileToJSON(jsonFilePath: path)
        }
        return nil
    }
    
   public static func fileToJSON(jsonFilePath : String) -> [String:Any]?{
        
        do{
            print("path to json file \(jsonFilePath)")
            let content = try? String.init(contentsOfFile: jsonFilePath)
            if let jsonString = content{
                let data = jsonString.data(using: .utf8)
                let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String:Any] //NSMutableDictionary
                return json
            }
            
        }
        catch{
            print("error \(error)");
        }
        
        return nil
        
    }
    
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

