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

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func selectFile(sender: AnyObject) {
        
        analiser?.file = analiser?.askFile()
        
        readFileButton.enabled = true
    }
    
    
    @IBAction func readFile(sender: AnyObject) {
        
        analiser?.run()
        
        saveFileButton.enabled = true
    }
    

    @IBAction func saveFile(sender: AnyObject) {
        text.hidden = false
        analiser?.saveTokensList()
        
    }
    
    

}

