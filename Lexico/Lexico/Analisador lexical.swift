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
        
        switch lexema {
        case "programa":
            return 1
        case "inicio":
            return 2
        case "fim":
            return 3
        case "procedimento":
            return 4
        case "funcao":
            return 5
        case "se":
            return 6
        case "entao":
            return 7
        case "senao":
            return 8
        case "enquanto":
            return 9
        case "faca":
            return 10
        case ":=":
            return 11
        case "escreva":
            return 12
        case "leia":
            return 13
        case "var":
            return 14
        case "inteiro":
            return 15
        case "booleano":
            return 16
        case "identificador":
            return 17
        case "numero":
            return 18
        case ".":
            return 19
        case ";":
            return 20
        case ",":
            return 21
        case "(":
            return 22
        case ")":
            return 23
        case ">":
            return 24
        case ">=":
            return 25
        case "=":
            return 26
        case "<":
            return 27
        case "<=":
            return 28
        case "!=":
            return 29
        case "+":
            return 30
        case "-":
            return 31
        case "*":
            return 32
        case "Div":
            return 33
        case "e":
            return 34
        case "ou":
            return 35
        case "nao":
            return 36
        case ":":
            return 37
            
        default: break
        }
        
        
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