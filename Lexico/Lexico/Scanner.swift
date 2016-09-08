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
        
        //var modifiedText = text.
        
        
        
        return modifiedText
    }
    
    
    
    
    
}