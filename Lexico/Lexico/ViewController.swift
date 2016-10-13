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
    
    @IBOutlet weak var text: NSTextField!
    var analiser : Analisador?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        analiser = Analisador()

    }

   
    
    @IBAction func selectFile(_ sender: AnyObject) {
        
        analiser?.file = analiser?.askFile()
        
        readFileButton.isEnabled = true
    }
    
    
    @IBAction func readFile(_ sender: AnyObject) {
        
        analiser?.run()
        
        saveFileButton.isEnabled = true
    }
    

    @IBAction func saveFile(_ sender: AnyObject) {
        text.isHidden = false
        analiser?.saveTokensList()
        
    }
    
    

}

