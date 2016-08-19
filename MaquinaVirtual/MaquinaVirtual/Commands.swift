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
    var s : Int = 0 //numero da pilha
    var M : [Int] = [] //pilha de dados
    var i : Int = 0 //numero da instrucao
   
    
    
    //class init
    init(aOutputView: NSTextView,aInputView : NSTextView){
        
        outputView = aOutputView
        inputView = aInputView
    }
    
    //engine helpers
    
    func getStackCount() -> Int {
   
        return M.count
    }
    
    func getStackRowContent(row : Int) -> String{
        
        if row < M.count {
            return M[row].description
        }
        
        return ""
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
    
    //inv function
    func invert() {
        M[s] = -M[s]
        
    }
    
    //and function
    func and(){
        if M[s-1] == 1 && M[s] == 1 {
            M[s-1] = 1
        }else{
            M[s-1] = 0
        }
        s = s-1
        
    }
    
    //or function
    func or(){
        if M[s-1] == 1 || M[s] == 1 {
            M[s-1] = 1
        }else{
            M[s-1] = 0
        }
        s = s-1
        
    }
    
    //neg function
    func neg(){
        M[s] = 1 - M[s]
        
    }
    
    //less than function
    func lessThan() {
        if M[s-1] < M[s]{
            M[s-1] = 1
        }else{
            M[s-1] = 0
        }
        s = s-1
    }
    
    //greater than function
    func greaterThan() {
        if M[s-1] > M[s]{
            M[s-1] = 1
        }else{
            M[s-1] = 0
        }
        s = s-1
    }
    
    //equal than function
    func equalThan() {
        if M[s-1] == M[s]{
            M[s-1] = 1
        }else{
            M[s-1] = 0
        }
        s = s-1
    }
    
    //different than function
    func diferentThan() {
        if M[s-1] != M[s]{
            M[s-1] = 1
        }else{
            M[s-1] = 0
        }
        s = s-1
    }
    
    //less or equal than function
    func lessEqualThan() {
        if M[s-1] <= M[s]{
            M[s-1] = 1
        }else{
            M[s-1] = 0
        }
        s = s-1
    }
    
    //greater or equal than function
    func greaterEqualThan() {
        if M[s-1] >= M[s]{
            M[s-1] = 1
        }else{
            M[s-1] = 0
        }
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
    
    //store function
    func store(n : Int) {
        M[n] = M[s]
        s = s-1
        
    }
    
    //jump function
    func jump(t : Int){
        i = t
        
    }
    
    //jump false function
    func jumpFalse(t : Int){
        if M[s] == 0 {
            i = t
        }else{
            i = i + 1
        }
        s = s - 1
        
    }
    
    //null
    func null() {
        //do nothing
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
    
    
    //printing Funtion
    func printOutput(){
        printInAView(M[s].description, aTextView: outputView)
        s = s-1
        
    }
    
    //alloc Function
    func alloc(m : Int, n : Int) {
        //equal to for int i = 0 ; i < n; i ++
        for k in 0...(n - 1) {
            s = s + 1
            M[s] = M[m + k]
            
        }
        
    }
    
    //dalloc Function
    func dalloc(m : Int, n : Int) {
        //equal to for int k = n - 1; k >= 0; k--
        for k in (0...(n - 1)).reverse() {
            M[m+k] = M[s]
            s = s-1
            
        }
        
    }
    
    //call Function
    func call(t : Int) {
        s = s + 1
        M[s] = i + 1
        i = t
    }
    
    //return Function
    func returnFromFunction() {
        i = M[s]
        s = s - 1
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
            invert()
            break
        case "AND":
            and()
            break
        case "OR":
            or()
            break
        case "NEG":
            neg()
            break
        case "CME":
            lessThan()
            break
        case "CMA":
            greaterThan()
            break
        case "CEQ":
            equalThan()
            break
        case "CDIF":
            diferentThan()
            break
        case "CMEQ":
            lessEqualThan()
            break
        case "CMAQ":
            greaterEqualThan()
            break
        case "START":
            startProgram()
            break
        case "HLT":
            haltProgram()
            break
        case "STR":
            store(firstParameter!)
            break
        case "JMP":
            jump(firstParameter!)
            break
        case "JMPF":
            jumpFalse(firstParameter!)
            break
        case "NULL":
            null()
            break
        case "RD":
            startReading()
            break
        case "PRN":
            printOutput()
            break
        case "ALLOC":
            alloc(firstParameter!, n: secondParameter!)
            break
        case "DALLOC":
            dalloc(firstParameter!, n: secondParameter!)
            break
        case "CALL":
            call(firstParameter!)
            break
        case "RETURN":
            returnFromFunction()
            break
            
        default:
            print(command + " is not valid")
        }
        
        //checar se o incremento ta implicito ou nao apenas se for algum dos jumps
        if command != "JMP" || command != "JMPF" {
            i = i + 1
        }
        
        
        
    }
    
    
    
    
    

}
