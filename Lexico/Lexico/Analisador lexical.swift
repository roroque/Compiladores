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
    var readerAndFormatter : Scanner?
    
    init(){
        
        readerAndFormatter = Scanner()
    }
    
    func run() {
        
        if file != nil {
            text = getText(file!)
            
            if text != nil{
                
                cleanText = cleanAText(text!)
                print(cleanText!)
                
            }
            
            
        }
        
        
    }
    
    func askFile() -> String? {
        
        let chooseFileWindow = NSOpenPanel()
        chooseFileWindow.runModal()
        
        let pathUrl = chooseFileWindow.URL?.path
        
        return pathUrl
    }
    
    func getText(url : String) -> String? {
        
        readerAndFormatter?.setUrl(url)
        
        return readerAndFormatter?.readFile()
        
    }
    
    func cleanAText(text : String) -> String? {
        
        
        
        return readerAndFormatter?.removeCommentsAndBlankSpaces(text)
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