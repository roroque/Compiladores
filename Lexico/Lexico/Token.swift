//
//  Token.swift
//  Lexico
//
//  Created by Gabriel Neves Ferreira on 9/8/16.
//  Copyright © 2016 Gabriel Neves Ferreira. All rights reserved.
//

import Cocoa


class Token  {
    
    var lexema : String?
    var simbolo : Int?
    var lineNumber : Int?
    
    
    init(){
        
    }
    
    
    func setLexema(_ lex : String) {
        
        lexema = lex
        
    }
    
    func setSimbolo(_ sims : Int) {
        
        simbolo = sims
    }
    
    func setLineNumber(_ line : Int) {
        
        lineNumber = line
    }
    
    func getLexema() -> String? {
        
        return lexema
    }
    
    func getSimbolo() -> Int? {
        
        return simbolo
    }
    
    func getLineNumber() -> Int? {
        
        return lineNumber
    }
    
    
    
    
    
}
