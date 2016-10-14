//
//  ViewController.swift
//  Lexico
//
//  Created by Gabriel Neves Ferreira on 9/8/16.
//  Copyright © 2016 Gabriel Neves Ferreira. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var readFileButton: NSButton!
    @IBOutlet weak var saveFileButton: NSButton!
    @IBOutlet weak var SintaxReadButton: NSButton!
    
    @IBOutlet weak var text: NSTextField!
    var analiser : Analisador?
    var sintaxer : Sintatico?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        analiser = Analisador()
        sintaxer = Sintatico(analiser: analiser!)

    }

   
    
    @IBAction func selectFile(_ sender: AnyObject) {
        
        analiser?.file = analiser?.askFile()
        
        readFileButton.isEnabled = true
    }
    
    
    @IBAction func readFile(_ sender: AnyObject) {
        
        analiser?.run()
        
        SintaxReadButton.isEnabled = true
    }
    

    @IBAction func saveFile(_ sender: AnyObject) {
        (text.cell as! NSTextFieldCell).title = "File Saved"
        analiser?.saveTokensList()
        
    }
    
    @IBAction func SintaxRead(_ sender: AnyObject) {
        text.isHidden = false
        if (sintaxer?.run())!{
            
            (text.cell as! NSTextFieldCell).title = "Passou Sintatico"
            
        }else{
            
            (text.cell as! NSTextFieldCell).title = "Falhou Sintatico"
        }
        
        saveFileButton.isEnabled = true
        
    }
    

}

