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
            print("arquivo invalido")
            return nil
        }

    }
    
    
    func removeCommentsAndBlankSpaces(text : String) -> String? {
        
        var modifiedText = text
        
        var firstIndex = 0
        var secondIndex = 0
        
        //put code to check if doesnt make any modifications break
        while true {
            firstIndex = 0
            secondIndex = 0
            //contains first piece and contains this type of commentary
            if modifiedText.containsString("{") {
                
                //contais second go and find
                if modifiedText.containsString("}"){
                    
                    //find first piece
                    for character in modifiedText.characters {
                        
                        if character == "{"{
                            
                            break
                            
                        }
                        firstIndex = firstIndex + 1
                    }
                    
                    //find second piece
                    
                    for character in modifiedText.characters {
                        
                        if character == "}"{
                            
                            break
                            
                        }
                        secondIndex = secondIndex + 1
                        
                    }
                    if secondIndex < firstIndex{
                        
                        //error de chave
                        print("erro de comentario")
                        return nil
                        
                    }
                    
                    let desiredRange = modifiedText.startIndex.advancedBy(firstIndex)...modifiedText.startIndex.advancedBy(secondIndex)
                    
                    modifiedText.removeRange(desiredRange)
                    
                    
                }else{
                    
                    //error de chave
                    print("erro de comentario")
                    return nil
                    
                }
                
            }else{
                
                //contains one but doenst contain the other
                if modifiedText.containsString("}") {
                    //error de fecha chave
                    print("erro de comentario")
                    return nil
                    
                }else{
                    
                    print("dont modify {}")
                    break
                }
                
            }
        
        }
        //put code to check if doesnt make any modifications break
        while true {
        
            //check second type of commentary
            //contains first piece
            if modifiedText.containsString("/*"){
                
                //contains second piece
                if modifiedText.containsString("*/") {
                    
                    //find first piece
                    for character in modifiedText.characters {
                        
                        if character == "/"{
                            //check if next is *
                            let selectedString = modifiedText[modifiedText.startIndex.advancedBy(firstIndex + 1)]
                            if selectedString == "*"{
                            break
                            
                            }else{
                                
                                print("erro de comentario")
                                return nil
                            }
                            
                            
                            
                            //else crash
                            
                        }
                        firstIndex = firstIndex + 1
                    }
                    
                    //find second piece
                    
                    for character in modifiedText.characters {
                        
                        if character == "/"{
                            //check if before *
                            //check if next is *
                            let selectedString = modifiedText[modifiedText.startIndex.advancedBy(secondIndex - 1)]
                            if selectedString == "*"{
                                break
                                
                            }
                            
                        }
                        secondIndex = secondIndex + 1
                        
                    }
                    if secondIndex < firstIndex{
                        
                        //error de chave
                        print("erro de comentario")
                        return nil
                        
                    }
                    
                    let desiredRange = modifiedText.startIndex.advancedBy(firstIndex)...modifiedText.startIndex.advancedBy(secondIndex)
                    
                    modifiedText.removeRange(desiredRange)
                    
                    
                    
                    
                    
                    
                    
                    
                }else{
                    
                    //doenst contains one of them
                    //error de comentario
                    print("erro de comentario")
                    return nil
                    
                    
                }
                
                
                
            }else{
                //doenst contain
                
                //contains one of them
                if modifiedText.containsString("*/") {
                    
                    //error de comentario
                    print("erro de comentario")
                    return nil
                }else{
                    
                    print("dont modify /*")
                    break
                    
                }
                
                
            }
        }
        //errors on programa
        //modifiedText = modifiedText.stringByReplacingOccurrencesOfString(" ", withString: "")
        modifiedText = modifiedText.stringByReplacingOccurrencesOfString("\t", withString: " ")
        modifiedText = modifiedText.stringByReplacingOccurrencesOfString("\n", withString: " ")

        
        return modifiedText
    }
    
    
    
    
    
}