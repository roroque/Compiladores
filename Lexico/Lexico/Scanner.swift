//
//  Scanner.swift
//  Lexico
//
//  Created by Gabriel Neves Ferreira on 9/8/16.
//  Copyright © 2016 Gabriel Neves Ferreira. All rights reserved.
//

import Cocoa


class Scanner  {
    
    var urlArquivo :String?
    
    
    init(){
    
    }
    
    func setUrl(url : String){
        
        urlArquivo = url
        
    }
    
    func readFile() -> String? {
        var fileContent : String = ""
        
        do{
            fileContent = try String(contentsOfFile: urlArquivo!)
            
            return fileContent

        }catch _ as NSError{
            return nil
        }
        
        
        return nil
    }
    
    
    func removeCommentsAndBlankSpaces(text : String) -> String {
        
        var modifiedText = text
        
        var firstIndex = 0
        var secondIndex = 0
        
        
        //put code to check if doesnt make any modifications break
        while false {
            
            //contains first piece and contains this type of commentary
            if modifiedText.containsString("{") {
                
                //contais second go and find
                if modifiedText.containsString("}"){
                    
                    //find first piece
                    for character in modifiedText.characters {
                        
                        if character == "{"{
                            
                            break
                            
                        }
                        
                    }
                    
                    //find second piece
                    
                    for character in modifiedText.characters {
                        
                        if character == "}"{
                            
                            break
                            
                        }
                        
                    }
                    
                    
                }else{
                    
                    //error de chave
                    
                }
                
            }else{
                
                //contains one but doenst contain the other
                if modifiedText.containsString("}") {
                    //error de fecha chave
                    
                }
                
            }
        
        }
        
        //put code to check if doesnt make any modifications break
        while false {
        
            //check second type of commentary
            //contains first piece
            if modifiedText.containsString("/*"){
                
                //contains second piece
                if modifiedText.containsString("*/") {
                    
                    
                    
                    //find first piece
                    //find second piece
                    
                    
                    
                    
                }else{
                    
                    //doenst contains one of them
                    //error de comentario
                    
                    
                }
                
                
                
            }else{
                //doenst contain
                //contains one of them
                if modifiedText.containsString("*/") {
                    
                    //error de comentario
                }
                
                
            }
        }

        modifiedText = modifiedText.stringByReplacingOccurrencesOfString(" ", withString: "")
        modifiedText = modifiedText.stringByReplacingOccurrencesOfString("\t", withString: "")
        modifiedText = modifiedText.stringByReplacingOccurrencesOfString("\n", withString: "")

        
        return modifiedText
    }
    
    
    
    
    
}