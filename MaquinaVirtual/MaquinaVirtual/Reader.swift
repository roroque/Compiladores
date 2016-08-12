//
//  Reader.swift
//  MaquinaVirtual
//
//  Created by Gabriel Neves Ferreira on 8/12/16.
//  Copyright © 2016 Gabriel Neves Ferreira. All rights reserved.
//

import Cocoa

class Reader {
    var url : String?
    
    init(){
        
    }
    
    init(fileUrl : String?){
        
        url = fileUrl
        
    }
    
    func changeFileURL(fileUrl : String){
        
        url = fileUrl
    
    }
    
    func readSelectedFile() -> [(String, String?, String?)]? {
        
        var commands : [(String, String?, String?)] = []
        if url != nil{
            
            do{
                let text = try String(contentsOfFile: url!)
                let sentences = text.componentsSeparatedByString("\n")
                
                for commandsWithArguments in sentences {
                    let arguments = commandsWithArguments.componentsSeparatedByString(" ")
                    if arguments.count == 1 {
                        commands.append((arguments[0],nil,nil))
                    }else{
                        if(arguments.count == 2){
                            commands.append((arguments[0],arguments[1],nil))
                            
                        }else{
                            if(arguments.count == 3){
                                commands.append((arguments[0],arguments[1],arguments[2]))
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
    
    
    
    
}