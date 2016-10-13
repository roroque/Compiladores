//
//  Analisador Sintatico.swift
//  Lexico
//
//  Created by Gabriel Neves Ferreira on 10/13/16.
//  Copyright © 2016 Gabriel Neves Ferreira. All rights reserved.
//

import Cocoa

class Sintatico {
    
    enum Simbolos : Int {
        case Sprograma = 1
        case Sinicio
        case Sfim
        case Sprocedimento
        case Sfuncao
        case Sse
        case Sentao
        case Ssenao
        case Senquanto
        case Sfaca
        case Sdoispontosigual
        case Sescreva
        case Sleia
        case Svar
        case Sinteiro
        case Sbooleano
        case Sidentificador
        case Snumero
        case Sponto
        case Spontovirgula
        case Svirgula
        case Sabreparenteses
        case Sfechaparenteses
        case Smaior
        case Smaiorigual
        case Sigual
        case Smenor
        case Smenorigual
        case Sdiferente
        case Smais
        case Smenos
        case Svezes
        case Sdiv
        case Sand
        case Sor
        case Snot
        case Sdoispontos
        
    }
    

    var maquinaAnalisador : Analisador
    var pointer : Int = -1
    var selectedToken : Token?
    
    init(analiser : Analisador) {
        maquinaAnalisador = analiser
    }
    
    
    func run() {
        
        //print(maquinaAnalisador.tokens)
        getToken()
        if selectedToken!.getSimbolo()! == Simbolos.Sprograma.rawValue  {
            print("inicial")
            getToken()
            
            if selectedToken!.getSimbolo()! == Simbolos.Sidentificador.rawValue {
                print("secundario")
                getToken()
                if selectedToken!.getSimbolo() == Simbolos.Spontovirgula.rawValue {
                    print("terciario")
                    AnalisaBloco()
                    if selectedToken!.getSimbolo() == Simbolos.Sponto.rawValue {
                        if pointer == (maquinaAnalisador.tokens.count - 1){
                            print("Sucesso")

                        }else{
                            print("ERROR")

                        }
                        
                    }else{
                        print("ERROR")
                        
                    }
                    
                }else{
                    print("ERROR")

                }
                
            }else{
                print("ERROR")
            }
            
            
        }else{
            print("ERROR")
        }
     
    }
    
    func AnalisaBloco(){
        getToken()
        AnalisaDecVar()
        AnalisaSubRotinas()
        AnalisaComandos()
    }
    
    func AnalisaDecVar(){
        if selectedToken!.getSimbolo() == Simbolos.Svar.rawValue {
            getToken()
            if selectedToken!.getSimbolo() == Simbolos.Sidentificador.rawValue {
                while selectedToken!.getSimbolo() == Simbolos.Sidentificador.rawValue {
                    AnalisaVar()
                    if selectedToken!.getSimbolo() == Simbolos.Spontovirgula.rawValue {
                        getToken()
                    }else{
                        print("ERROR")
                        
                    }
                    
                }
                
            }else{
                print("ERROR")
                
            }
            
            
        }
        
    }
    
    func AnalisaVar(){
        
        repeat{
            
            
        }while selectedToken!.getSimbolo() != Simbolos.Spontovirgula.rawValue
        
        
        
    }
    
    func AnalisaTipo(){
        
    }
    
    func AnalisaComandos(){
        
    }
    
    func AnalisaComandoSimples(){
        
    }
    
    func AnalisaAtriChProcedimento(){
        
    }
    
    func AnalisaLeia(){
        
    }
    
    func AnalisaEscreva(){
        
    }
    
    func AnalisaEnquanto(){
        
    }
    
    func AnalisaSe(){
        
    }
    
    func AnalisaSubRotinas(){
        
    }
    
    func AnalisaDecProced(){
        
    }
    
    func AnalisaDecFunc(){
        
    }
    
    func AnalisaExp(){
        
    }
    
    func AnalisaExpSimp(){
        
    }
    
    func AnalisaTermo(){
        
    }
    
    func AnalisaFator(){
        
    }
    
    func AnalisaChProced(){
        
    }
    
    func AnalisaChFunc(){
        
    }
    
    
    
    //Funcoes auxiliares
    
    func getToken() {
        
        pointer += 1
        selectedToken = maquinaAnalisador.tokens[pointer]
        
    }




}
