//
//  Analisador lexical.swift
//  Lexico
//
//  Created by Gabriel Neves Ferreira on 9/8/16.
//  Copyright © 2016 Gabriel Neves Ferreira. All rights reserved.
//

import Cocoa

fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}


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
        tokens = []
        if file != nil {
            text = getText(file!)
            
            if text != nil{
                
                cleanText = cleanAText(text!)
                
                if cleanText != nil {
                    
                
                
                    print(cleanText!)
                    
                    while textPointer < cleanText?.characters.count {
                        let receivedToken = getNextToken()
                        if receivedToken != nil {
                            print((receivedToken!.getLexema())! + " " + (receivedToken!.getSimbolo()?.description)!)
                            tokens.append(receivedToken!)
                        }
                    }
                }else{
                    
                }
                
            }
            
            
        }
        
        
    }
    
    func askFile() -> String? {
        
        let chooseFileWindow = NSOpenPanel()
        chooseFileWindow.runModal()
        
        let pathUrl = chooseFileWindow.url?.path
        
        return pathUrl
    }
    
    func getText(_ url : String) -> String? {
        
        readerAndFormatter?.setUrl(url)
        
        return readerAndFormatter?.readFile()
        
    }
    
    func cleanAText(_ text : String) -> String? {

        return readerAndFormatter?.removeCommentsAndBlankSpaces(text)
    }
    
    func getRespectiveSimbolo( lexema : String) -> Int? {
        
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
        case "div":
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
        let newString = cleanText! as NSString
        let selectedCharacter = newString.character(at: textPointer)
        let selectedString = cleanText![cleanText!.characters.index(cleanText!.startIndex, offsetBy: textPointer)]
        //print(selectedString)
        
        if selectedString != " " {
        
        
            //check if is a number
            if  CharacterSet.decimalDigits.contains(UnicodeScalar(selectedCharacter)!) {
                //is number
                return readNumber()
            }else{
                //check if letter
                if CharacterSet.letters.contains(UnicodeScalar(selectedCharacter)!){
                    //is letter
                    return readIdentifiedOrReservedWord()
                }else{
                    if selectedString == ":" {
                        //is attribution
                        return readAttribution()
                    }else{
                        if "+-*".contains(String(selectedString)) {
                            //is arithmetic operator
                            return readArithmeticOperator()
                        }else{
                            if "><=!".contains(String(selectedString)){
                                //is relational operator
                                return readRelationalOperator()
                            }else{
                                if ";.(),".contains(String(selectedString)) {
                                    //is punctuation
                                    return readPunctuation()
                                }else{
                                    //ERROR
                                    
                                    
                                        print("error")
                                        print(selectedString)
                                        print("-------")
                                    ErrorThrower().showError(errorNumber: "error\n \(selectedString) ")
                                    
                                    textPointer = textPointer + 1

                                    return nil
                                }
                                
                                
                            }
                            
                            
                        }
                    
                        
                    }
                    
                    
                }
                
                
            }
        }
            
            textPointer = textPointer + 1
        return nil
    }
    
    func readNumber() -> Token?{
        let newString = cleanText! as NSString
        var selectedCharacter = newString.character(at: textPointer)
        var selectedString = cleanText![cleanText!.characters.index(cleanText!.startIndex, offsetBy: textPointer)]
        
        //add letter to number
        var numberString = String(selectedString)
        
        //read character
        textPointer = textPointer + 1
        selectedCharacter = newString.character(at: textPointer)
        selectedString = cleanText![cleanText!.characters.index(cleanText!.startIndex, offsetBy: textPointer)]
        
        //check if next letter is number
        while CharacterSet.decimalDigits.contains(UnicodeScalar(selectedCharacter)!) {
            //add letter to number
            numberString.append(selectedString)
            
            //read character
            textPointer = textPointer + 1
            selectedCharacter = newString.character(at: textPointer)
            selectedString = cleanText![cleanText!.characters.index(cleanText!.startIndex, offsetBy: textPointer)]
            
        }
        
        let newToken = Token()
        newToken.setLexema(numberString)
        newToken.setSimbolo(getRespectiveSimbolo(lexema: "numero")!)
        
        return newToken
    }
    
    func readIdentifiedOrReservedWord() -> Token?{
        let newString = cleanText! as NSString
        var selectedCharacter = newString.character(at: textPointer)
        var selectedString = cleanText![cleanText!.characters.index(cleanText!.startIndex, offsetBy: textPointer)]
        
        //add letter to id
        var id = String(selectedString)
        
        //read character
        textPointer = textPointer + 1
        selectedCharacter = newString.character(at: textPointer)
        selectedString = cleanText![cleanText!.characters.index(cleanText!.startIndex, offsetBy: textPointer)]
        
        //check if next letter is number or character or _
        while CharacterSet.decimalDigits.contains(UnicodeScalar(selectedCharacter)!) || CharacterSet.letters.contains(UnicodeScalar(selectedCharacter)!) || selectedString == "_" {
            //add letter to number
            id.append(selectedString)
            
            //read character
            textPointer = textPointer + 1
            selectedCharacter = newString.character(at: textPointer)
            selectedString = cleanText![cleanText!.characters.index(cleanText!.startIndex, offsetBy: textPointer)]
            
        }
        
        let newToken = Token()
        newToken.setLexema(id)
        
        
        let simbolo = getRespectiveSimbolo(lexema: id)
        if simbolo != nil {
            
            newToken.setSimbolo(simbolo!)
            
        }else{
            newToken.setSimbolo(getRespectiveSimbolo(lexema: "identificador")!)
        }
        
        
        return newToken
    }
    
    
    func readAttribution() -> Token?{
        
        var selectedString = cleanText![cleanText!.characters.index(cleanText!.startIndex, offsetBy: textPointer)]
        
        //add letter to id
        var id = String(selectedString)
        
        //read character
        textPointer = textPointer + 1
        selectedString = cleanText![cleanText!.characters.index(cleanText!.startIndex, offsetBy: textPointer)]
        
        //check id two points or atribuicao
        if selectedString == "=" {
            id.append(selectedString)
            textPointer = textPointer + 1

        }
        
        let newToken = Token()
        newToken.setLexema(id)
        newToken.setSimbolo(getRespectiveSimbolo(lexema: id)!)
        
        
        return newToken
    }
    
    func readArithmeticOperator() -> Token?{
        
        let selectedString = cleanText![cleanText!.characters.index(cleanText!.startIndex, offsetBy: textPointer)]
        
        //add letter to id
        let id = String(selectedString)
        
        //read character
        textPointer = textPointer + 1
        
        let newToken = Token()
        newToken.setLexema(id)
        newToken.setSimbolo(getRespectiveSimbolo(lexema: id)!)
        
        
        return newToken

    }
    
    func readRelationalOperator() -> Token?{
        
        var selectedString = cleanText![cleanText!.characters.index(cleanText!.startIndex, offsetBy: textPointer)]
        
        //add letter to id
        var id = String(selectedString)
        
        if selectedString == "!" {
        
            //read character
            textPointer = textPointer + 1
            selectedString = cleanText![cleanText!.characters.index(cleanText!.startIndex, offsetBy: textPointer)]
            
            //check id different
            if selectedString == "=" {
                id.append(selectedString)
                textPointer = textPointer + 1
            }else{
                //error
                print("error")
                print(id)
                print("-----")
                textPointer = textPointer + 1
                ErrorThrower().showError(errorNumber: "error\n \(selectedString) ")
                return nil
            }
            
            
        }else{
            if selectedString == "=" {
                
                //read character
                textPointer = textPointer + 1
                selectedString = cleanText![cleanText!.characters.index(cleanText!.startIndex, offsetBy: textPointer)]
                
                //check id different
                if selectedString == "=" {
                    id.append(selectedString)
                }else{
                    
                }

                
                
            }else{
                
                //read character
                textPointer = textPointer + 1
                selectedString = cleanText![cleanText!.characters.index(cleanText!.startIndex, offsetBy: textPointer)]
                
                //check id different
                if selectedString == "=" {
                    id.append(selectedString)
                    textPointer = textPointer + 1
                }
                
                
                
            }
            
        }
        
        
        
       
        let newToken = Token()
        newToken.setLexema(id)
        newToken.setSimbolo(getRespectiveSimbolo(lexema: id)!)
        
        //textPointer = textPointer + 1

        return newToken
    }
    
    func readPunctuation() -> Token?{
        
        let selectedString = cleanText![cleanText!.characters.index(cleanText!.startIndex, offsetBy: textPointer)]
        
        //add letter to id
        let id = String(selectedString)
        
        //read character
        textPointer = textPointer + 1
        
        let newToken = Token()
        newToken.setLexema(id)
        newToken.setSimbolo(getRespectiveSimbolo(lexema: id)!)
        
        
        return newToken

    }
    
    func saveTokensList(){
        
        let newFile = "tokens.txt"
        var content = ""
        for selectedToken in tokens {
            
            content.append( selectedToken.getLexema()! + " " + (selectedToken.getSimbolo()?.description)! + "\n")
            
        }
        
        if let desktopPath : NSString = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.desktopDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true).first as NSString? {
            let path = desktopPath.appendingPathComponent(newFile);
            do{
                
                try content.write(toFile: path, atomically: false, encoding: String.Encoding.utf8)
                
            } catch { 
               print("error writing")
            }
        
        }
    }
    
    
    
    
    
    
    
    
    
    
}
