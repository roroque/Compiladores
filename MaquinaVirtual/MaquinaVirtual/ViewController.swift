//
//  ViewController.swift
//  MaquinaVirtualCompiladores
//
//  Created by Gabriel Neves Ferreira on 8/11/16.
//  Copyright © 2016 Gabriel Neves Ferreira. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet var InputTextView: NSTextView!
    
    @IBOutlet var OutputTextView: NSTextView!
    
    var engine : Commands?
    var engineReader : Reader?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        engine = Commands(aOutputView: OutputTextView,aInputView: InputTextView)
        
        engineReader = Reader()
        
        
        
        
        
        
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
}

