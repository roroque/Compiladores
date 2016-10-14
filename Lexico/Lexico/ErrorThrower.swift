//
//  ErrorThrower.swift
//  Lexico
//
//  Created by Gabriel Neves Ferreira on 10/14/16.
//  Copyright © 2016 Gabriel Neves Ferreira. All rights reserved.
//

import Cocoa
class ErrorThrower  {

    func showError(errorNumber : String){
        
        let alert:NSAlert = NSAlert();
        alert.messageText = "Error";
        alert.informativeText = errorNumber;
        alert.runModal();
        
    }
    

}
