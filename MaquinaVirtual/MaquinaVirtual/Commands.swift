//
//  Commands.swift
//  MaquinaVirtualCompiladores
//
//  Created by Gabriel Neves Ferreira on 8/11/16.
//  Copyright © 2016 Gabriel Neves Ferreira. All rights reserved.
//

import Cocoa

class Commands {
    
    //Views to modify
    var outputView : NSTextView
    var inputView : NSTextView
    
    //Engine variables
    var s : Int = -1
    var M : [Int] = []
    
    //class init
    init(aOutputView: NSTextView,aInputView : NSTextView){
        
        outputView = aOutputView
        inputView = aInputView
    }
    
    //Virtual Machine Functions
    
    //printing Funtion
    func printOutput(){
        
        
        printInAView(M[s].description, aTextView: outputView)
        s = s-1
        
        
    }
    
    //reading Functions
    func startReading(){
        s = s + 1
        //enable text field for writing
        //disable text field to continue
        //olhar melhor essa logica
    }
    
    func finishReading(value : Int){
        
        M.append(value)
        //disable text field for writing
        //enable text field to continue
        //olhar melhor essa logica
        printInAView(value.description, aTextView: inputView)
        
        
    }
    
    
    
    
    
    
    //Auxiliary Functions
    
    private func printInAView(aString: String,aTextView : NSTextView) {
        
        aTextView.editable = true
        aTextView.insertText(aString)
        aTextView.insertNewline(nil)
        aTextView.editable = false

    }
    
    
    //Switch for functions
    
    func callFunctionWithCommand(command : String,firstParameter : String?, secondParameter : String?){
        
        switch command {
        case "PRN":
            printOutput()
            break
        case "RD":
            startReading()
            break
            
        default:
            print(command + " is not valid")
        }
        
        
        
    }
    
    
    
    
    

}
