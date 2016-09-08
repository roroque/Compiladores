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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func selectFile(sender: AnyObject) {
        
        print(Analisador().askFile())
        
        readFileButton.enabled = true
    }
    
    
    @IBAction func readFile(sender: AnyObject) {
        
        saveFileButton.enabled = true
    }
    

    @IBAction func saveFile(sender: AnyObject) {
    }
    
    

}

