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
    var s : Int = 0
    var M : [Int] = []
    
    //class init
    init(aOutputView: NSTextView,aInputView : NSTextView){
        
        outputView = aOutputView
        inputView = aInputView
    }
    
    //Virtual Machine Functions
    
  
    //ldc function
    func loadConstant(k : Int) {
        s = s + 1
        M[s] = k
        
    }
    
    //ldv function
    func loadValue(n : Int) {
        s = s + 1
        M[s] = M[n]
        
    }
    
    //add function
    func add() {
        M[s-1] = M[s-1] + M[s]
        s = s-1
        
    }
    
    //sub function
    func sub() {
        M[s-1] = M[s-1] - M[s]
        s = s-1
        
    }
    
    //mult function
    func mult() {
        M[s-1] = M[s-1] * M[s]
        s = s-1
        
    }
    
    //div function
    func div() {
        M[s-1] = M[s-1] / M[s]
        s = s-1
        
    }
    
    
    //start Function
    func startProgram() {
        
        s = -1
        
        //olhar melhor essa logica
    }
    
    //halt function
    func haltProgram() {
        //olhar melhor essa logica
        
    }
    
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
    
    func callFunctionWithCommand(command : String,firstParameter : Int?, secondParameter : Int?){
        
        switch command {
        case "LDC":
            loadConstant(firstParameter!)
            break
        case "LDV":
            loadValue(firstParameter!)
            break
        case "ADD":
            add()
            break
        case "SUB":
            sub()
            break
        case "MULT":
            mult()
            break
        case "DIVI":
            div()
            break
        case "INV":
            break
        case "AND":
            break
        case "OR":
            break
        case "NEG":
            break
        case "CME":
            break
        case "CMA":
            break
        case "CEQ":
            break
        case "CDIF":
            break
        case "CMEQ":
            break
        case "CMAQ":
            break
        case "START":
            startProgram()
            break
        case "HLT":
            haltProgram()
            break
        case "STR":
            break
        case "JMP":
            break
        case "JMPF":
            break
        case "NULL":
            break
        case "RD":
            startReading()
            break
        case "PRN":
            printOutput()
            break
        case "ALLOC":
            break
        case "DALLOC":
            break
        case "CALL":
            break
        case "RETURN":
            break
            
        default:
            print(command + " is not valid")
        }
        
        
        
    }
    
    
    
    
    

}
