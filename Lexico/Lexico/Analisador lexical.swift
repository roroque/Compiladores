//
//  Analisador lexical.swift
//  Lexico
//
//  Created by Gabriel Neves Ferreira on 9/8/16.
//  Copyright © 2016 Gabriel Neves Ferreira. All rights reserved.
//

import Cocoa

class Analisador  {
    
    var text : String?
    var cleanText : String?
    var tokens : [Token] = []
    var textPointer : Int = 0
    var file : String?
    
    init(){
        
    }
    
    func askFile() -> String? {
        
        let chooseFileWindow = NSOpenPanel()
        chooseFileWindow.runModal()
        
        let pathUrl = chooseFileWindow.URL?.path
        
        return pathUrl
    }
    
    func getText(url : String) -> String? {
        
        return nil
    }
    
    func cleanAText(text : String) -> String? {
        
        return nil
    }
    
    func getRespectiveSimbolo(lexema : String) -> Int? {
        
        return nil
    }
    
    func getNextToken() -> Token?{
        
        return nil
    }
    
    func readNumber() -> Token?{
        
        return nil
    }
    
    func readIdentifiedOrReservedWord() -> Token?{
        
        return nil
    }
    
    
    func readAttribution() -> Token?{
        
        return nil
    }
    
    func readArithmeticOperator() -> Token?{
        
        return nil
    }
    
    func readRelationalOperator() -> Token?{
        
        return nil
    }
    
    func readPunctuation() -> Token?{
        
        return nil
    }
    
    func saveTokensList(){
        
    }
    
    func showError(errorNumber : Int){
        
    }
    
    
    
    
    
    
    
    
    
}