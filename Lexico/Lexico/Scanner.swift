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
    
    func setUrl(_ url : String){
        
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
    
    
    func removeCommentsAndBlankSpaces(_ text : String) -> String? {
        
        var modifiedText = text
        
        var firstIndex = 0
        var secondIndex = 0
        
        //put code to check if doesnt make any modifications break
        while true {
            firstIndex = 0
            secondIndex = 0
            //contains first piece and contains this type of commentary
            if modifiedText.contains("{") {
                
                //contais second go and find
                if modifiedText.contains("}"){
                    
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
                    
                    let desiredRange = modifiedText.characters.index(modifiedText.startIndex, offsetBy: firstIndex)...modifiedText.characters.index(modifiedText.startIndex, offsetBy: secondIndex)
                    
                    modifiedText.removeSubrange(desiredRange)
                    
                    
                }else{
                    
                    //error de chave
                    print("erro de comentario")
                    return nil
                    
                }
                
            }else{
                
                //contains one but doenst contain the other
                if modifiedText.contains("}") {
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
            firstIndex = 0
            secondIndex = 0
            //check second type of commentary
            //contains first piece
            if modifiedText.contains("/*"){
                
                //contains second piece
                if modifiedText.contains("*/") {
                    
                    //find first piece
                    for character in modifiedText.characters {
                        
                        if character == "/"{
                            //check if next is *
                            let selectedString = modifiedText[modifiedText.characters.index(modifiedText.startIndex, offsetBy: firstIndex + 1)]
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
                        if secondIndex != 0 {
                            
                        
                            if character == "/"{
                                //check if before *
                                //check if next is *
                                let selectedString = modifiedText[modifiedText.characters.index(modifiedText.startIndex, offsetBy: secondIndex - 1)]
                                if selectedString == "*"{
                                    break
                                    
                                }
                                
                            }
                        }
                        secondIndex = secondIndex + 1
                        
                    }
                    if secondIndex < firstIndex{
                        
                        //error de chave
                        print("erro de comentario")
                        return nil
                        
                    }
                    
                    let desiredRange = modifiedText.characters.index(modifiedText.startIndex, offsetBy: firstIndex)...modifiedText.characters.index(modifiedText.startIndex, offsetBy: secondIndex)
                    
                    modifiedText.removeSubrange(desiredRange)
                    
                    
                    
                    
                    
                    
                    
                    
                }else{
                    
                    //doenst contains one of them
                    //error de comentario
                    print("erro de comentario")
                    return nil
                    
                    
                }
                
                
                
            }else{
                //doenst contain
                
                //contains one of them
                if modifiedText.contains("*/") {
                    
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
        modifiedText = modifiedText.replacingOccurrences(of: "\t", with: " ")
        modifiedText = modifiedText.replacingOccurrences(of: "\n", with: " ")
        modifiedText = modifiedText.replacingOccurrences(of: "\r", with: " ")


        
        return modifiedText
    }
    
    
    
    
    
}
