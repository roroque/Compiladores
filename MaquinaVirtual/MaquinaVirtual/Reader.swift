//
//  Reader.swift
//  MaquinaVirtual
//
//  Created by Gabriel Neves Ferreira on 8/12/16.
//  Copyright © 2016 Gabriel Neves Ferreira. All rights reserved.
//

import Cocoa

class Reader {
    var pathUrl : String?
    
    init(){
        
    }
    
    init(fileUrl : String?){
        
        pathUrl = fileUrl
        
    }
    
    func changeFileURL(fileUrl : String){
        
        pathUrl = fileUrl
    
    }
    
    func readSelectedFile() -> [(String, Int?, Int?)]? {
        var commands : [(String, Int?, Int?)] = []
        if pathUrl != nil{
            
            do{
                let text = try String(contentsOfFile: pathUrl!)
                let sentences = text.componentsSeparatedByString("\n")
                
                for commandsWithArguments in sentences {
                    let arguments = commandsWithArguments.componentsSeparatedByString(" ")
                    if arguments.count == 1 {
                        commands.append((arguments[0],nil,nil))
                    }else{
                        let parameters = arguments[1].componentsSeparatedByString(",")
                        if(parameters.count == 1){
                            commands.append((arguments[0],Int(parameters[0]),nil))
                            
                        }else{
                            if(arguments.count == 2){
                                commands.append((arguments[0],Int(parameters[0]),Int(parameters[1])))
                            }
                            
                        }
                    }
                }
                
                
                return commands
                
            }catch _ as NSError{
                return nil
            }
            
        }
        
        
        
        return nil
    }
    
    func openTxt() {
        
        var chooseFileWindow = NSOpenPanel()
        chooseFileWindow.title = "Choose a txt file"
        chooseFileWindow.canChooseDirectories = false
        chooseFileWindow.runModal()
        
        pathUrl = pathUrl!
        
    }
    
    
    func openFile() {
        
        var myFileDialog: NSOpenPanel = NSOpenPanel()
        myFileDialog.runModal()
        
        // Get the path to the file chosen in the NSOpenPanel
        var path = myFileDialog.URL?.path
        
        // Make sure that a path was chosen
        if (path != nil) {
            var err = NSError?()
           // let text = String(contentsOfFile: path!)
            
            if !(err != nil) {
               // NSLog(text!)
            }
        }
    }
    
    
    
    
}