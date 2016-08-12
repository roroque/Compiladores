//
//  Reader.swift
//  MaquinaVirtual
//
//  Created by Gabriel Neves Ferreira on 8/12/16.
//  Copyright © 2016 Gabriel Neves Ferreira. All rights reserved.
//

import Cocoa

class Reader {
    var url : String?
    
    init(){
        
    }
    
    init(fileUrl : String?){
        
        url = fileUrl
        
    }
    
    func changeFileURL(fileUrl : String){
        
        url = fileUrl
    
    }
    
    
    
    
}