//
//  Analisador Sintatico.swift
//  Lexico
//
//  Created by Gabriel Neves Ferreira on 10/13/16.
//  Copyright © 2016 Gabriel Neves Ferreira. All rights reserved.
//

import Cocoa

class Sintatico {

    var maquinaAnalisador : Analisador
    
    init(analiser : Analisador) {
        maquinaAnalisador = analiser
    }
    
    
    func run() {
        
        print(maquinaAnalisador.tokens)
        
        
    }




}
