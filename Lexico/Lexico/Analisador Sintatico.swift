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
            if selectedToken!.getSimbolo() == Simbolos.Sidentificador.rawValue {
                
                getToken()
                if selectedToken!.getSimbolo() == Simbolos.Svirgula.rawValue || selectedToken!.getSimbolo() == Simbolos.Sdoispontos.rawValue  {
                    
                    if selectedToken!.getSimbolo() == Simbolos.Svirgula.rawValue {
                        
                        getToken()
                        if selectedToken!.getSimbolo() == Simbolos.Sdoispontos.rawValue {
                            
                            print("ERROR")
                            
                        }
                        
                        
                    }
                    
                    
                }else{
                    print("ERROR")
                    
                }
                
            }else{
                print("ERROR")
                
            }
            
            
        }while selectedToken!.getSimbolo() != Simbolos.Spontovirgula.rawValue
        getToken()
        AnalisaTipo()
        
        
    }
    
    func AnalisaTipo(){
        
        if selectedToken!.getSimbolo() != Simbolos.Sinteiro.rawValue && selectedToken!.getSimbolo() != Simbolos.Sbooleano.rawValue {
            
            print("ERROR")

        }
        
        getToken()
        
    }
    
    func AnalisaComandos(){
        
        if selectedToken!.getSimbolo() == Simbolos.Sinicio.rawValue {
            getToken()
            AnalisaComandoSimples()
            while selectedToken!.getSimbolo() != Simbolos.Sfim.rawValue {
                
                if selectedToken!.getSimbolo() == Simbolos.Spontovirgula.rawValue {
                    getToken()
                    
                    if selectedToken!.getSimbolo() != Simbolos.Sfim.rawValue {
                        AnalisaComandoSimples()
                    }
                    
                    
                    
                }else{
                    print("ERROR")
                    
                }
            }
            
            getToken()
            
        }else{
            
            print("ERROR")
            
        }
        
        
    }
    
    func AnalisaComandoSimples(){
        
        if selectedToken!.getSimbolo() == Simbolos.Sidentificador.rawValue {
            AnalisaChProced()
        }else{
            
            if selectedToken!.getSimbolo() == Simbolos.Sse.rawValue {
                AnalisaSe()
            }else{
                
                if selectedToken!.getSimbolo() == Simbolos.Senquanto.rawValue {
                    
                    AnalisaEnquanto()
                    
                    
                }else{
                    
                    if selectedToken!.getSimbolo() == Simbolos.Sleia.rawValue {
                        
                        AnalisaLeia()
                        
                    }else{
                        
                        if selectedToken!.getSimbolo() == Simbolos.Sescreva.rawValue {
                            
                            AnalisaEscreva()
                            
                        }else{
                            
                            AnalisaComandos()
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
        
    }
    
    func AnalisaAtriChProcedimento(){
        
        getToken()
        if selectedToken!.getSimbolo() == Simbolos.Sdoispontosigual.rawValue {
            
            AnalisaAtribuicao()
            
        }else{
            AnalisaChProced()
        }
        
    }
    
    func AnalisaLeia(){
        
        getToken()
        if selectedToken!.getSimbolo() == Simbolos.Sabreparenteses.rawValue  {
            
            getToken()
            
            if selectedToken!.getSimbolo() == Simbolos.Sidentificador.rawValue {
                getToken()
                
                if selectedToken!.getSimbolo() == Simbolos.Sfechaparenteses.rawValue {
                    
                    getToken()
                
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
    
    func AnalisaEscreva(){
        
        getToken()
        if selectedToken!.getSimbolo() == Simbolos.Sabreparenteses.rawValue {
            
            getToken()
            if selectedToken!.getSimbolo() == Simbolos.Sidentificador.rawValue {
                
                getToken()
                if selectedToken!.getSimbolo() == Simbolos.Sfechaparenteses.rawValue {
                    getToken()
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
    
    func AnalisaEnquanto(){
        
        getToken()
        AnalisaExp()
        if selectedToken!.getSimbolo() == Simbolos.Sfaca.rawValue {
            
            getToken()
            AnalisaComandoSimples()
            
            
        }else{
            
            print("ERROR")
            
        }
        
        
    }
    
    func AnalisaSe(){
        
        getToken()
        AnalisaExp()
        if selectedToken!.getSimbolo() == Simbolos.Sentao.rawValue {
            
            getToken()
            AnalisaComandoSimples()
            
            if selectedToken!.getSimbolo() == Simbolos.Ssenao.rawValue {
                getToken()
                AnalisaComandoSimples()
            }
            
            
        }else{
            
            print("ERROR")
            
        }
        
        
    }
    
    func AnalisaSubRotinas(){
        //var flag = 0
        
        if selectedToken!.getSimbolo() == Simbolos.Sprocedimento.rawValue || selectedToken!.getSimbolo() == Simbolos.Sfuncao.rawValue {
            
        }
        
        while selectedToken!.getSimbolo() == Simbolos.Sprocedimento.rawValue || selectedToken!.getSimbolo() == Simbolos.Sfuncao.rawValue {
            
            if selectedToken!.getSimbolo() == Simbolos.Sprocedimento.rawValue {
                AnalisaDecProced()
            }else{
                
                AnalisaDecFunc()
                
            }
            
            if selectedToken!.getSimbolo() == Simbolos.Spontovirgula.rawValue {
                getToken()
            }else{
                
                print("ERROR")
                
            }
            
            
        }
        
        
        
    }
    
    func AnalisaDecProced(){
        
        getToken()
        if selectedToken!.getSimbolo() == Simbolos.Sidentificador.rawValue {
            
            getToken()
            if selectedToken!.getSimbolo() == Simbolos.Spontovirgula.rawValue {
                AnalisaBloco()
            }else{
                
                print("ERROR")
                
            }
            
            
        }else{
            
            print("ERROR")
            
        }
        
        
        
    }
    
    func AnalisaDecFunc(){
        
        getToken()
        
        if selectedToken!.getSimbolo() == Simbolos.Sidentificador.rawValue {
            
            getToken()
            if selectedToken!.getSimbolo() == Simbolos.Sdoispontos.rawValue{
                
                getToken()
                
                if selectedToken!.getSimbolo() == Simbolos.Sinteiro.rawValue || selectedToken!.getSimbolo() == Simbolos.Sbooleano.rawValue {
                    
                    getToken()
                    if selectedToken!.getSimbolo() == Simbolos.Spontovirgula.rawValue {
                        AnalisaBloco()
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
    
    func AnalisaExp(){
        
        AnalisaExpSimp()
        if selectedToken!.getSimbolo() == Simbolos.Smaior.rawValue || selectedToken!.getSimbolo() == Simbolos.Smaiorigual.rawValue || selectedToken!.getSimbolo() == Simbolos.Sigual.rawValue || selectedToken!.getSimbolo() == Simbolos.Smenor.rawValue  || selectedToken!.getSimbolo() == Simbolos.Smenorigual.rawValue  || selectedToken!.getSimbolo() == Simbolos.Sdiferente.rawValue  {
            
            getToken()
            AnalisaExpSimp()
        }
    }
    
    func AnalisaExpSimp(){
        
        if selectedToken!.getSimbolo() == Simbolos.Smais.rawValue || selectedToken!.getSimbolo() == Simbolos.Smenos.rawValue {
            getToken()
        }
        
        AnalisaTermo()
        while selectedToken!.getSimbolo() == Simbolos.Smais.rawValue || selectedToken!.getSimbolo() == Simbolos.Smenos.rawValue || selectedToken!.getSimbolo() == Simbolos.Sor.rawValue {
            getToken()
            AnalisaTermo()
        }
        
        
        
        
    }
    
    func AnalisaTermo(){
        
        AnalisaFator()
        while selectedToken!.getSimbolo() == Simbolos.Svezes.rawValue || selectedToken!.getSimbolo() == Simbolos.Sdiv.rawValue || selectedToken!.getSimbolo() == Simbolos.Sse.rawValue  {
            
            getToken()
            AnalisaFator()
            
        }
        
        
    }
    
    func AnalisaFator(){
        
        if selectedToken!.getSimbolo() == Simbolos.Sidentificador.rawValue {
            
            AnalisaChFunc()
            
            
        }else{
            
            
            if selectedToken!.getSimbolo() == Simbolos.Snumero.rawValue {
                
                getToken()
                
            }else{
                
                if selectedToken!.getSimbolo() == Simbolos.Snot.rawValue {
                    getToken()
                    AnalisaFator()
                }else{
                    
                    if selectedToken!.getSimbolo() == Simbolos.Sabreparenteses.rawValue {
                        
                        getToken()
                        AnalisaExp()
                        if  selectedToken!.getSimbolo() == Simbolos.Sfechaparenteses.rawValue {
                            getToken()
                        }else{
                            
                            print("ERROR")
                            
                        }
                        
                    }else{
                        
                        if selectedToken!.getLexema() == "verdadeiro" || selectedToken!.getLexema() == "falso"  {
                            getToken()
                        }else{
                            
                            print("ERROR")
                            
                            
                        }
                        
                    }
                    
                    
                }
                
                
            }
            
        }
        
        
    }
    
    func AnalisaChProced(){
        
        //so checar se foi um procedimento tambem conhecido como um identificador
        
    }
    
    func AnalisaChFunc(){
        //olhar analisa fator checar o que deve ser feito
        
    }
    
    func AnalisaAtribuicao() {
        
        //tomar cuidado talvez seja muito pouco
        
    }
    
    
    
    //Funcoes auxiliares
    
    func getToken() {
        
        pointer += 1
        selectedToken = maquinaAnalisador.tokens[pointer]
        
    }




}
