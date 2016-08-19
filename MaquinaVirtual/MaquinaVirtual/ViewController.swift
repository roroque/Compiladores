//
//  ViewController.swift
//  MaquinaVirtualCompiladores
//
//  Created by Gabriel Neves Ferreira on 8/11/16.
//  Copyright © 2016 Gabriel Neves Ferreira. All rights reserved.
//

import Cocoa

class ViewController: NSViewController,NSTableViewDataSource,NSTableViewDelegate {

    @IBOutlet weak var stackView: NSTableView!
    
    @IBOutlet var InputTextView: NSTextView!
    
    @IBOutlet var OutputTextView: NSTextView!
    
    var engine : Commands?
    var engineReader : Reader?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        engine = Commands(aOutputView: OutputTextView,aInputView: InputTextView)
        
        engineReader = Reader()
        
        stackView.setDelegate(self)
        stackView.setDataSource(self)
        
        engine?.M = [1,2,3,4,5]
        
        stackView.reloadData()
        
        

    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
    //table view methods
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        
        
        if tableView == stackView {
            
            return (engine?.getStackCount())!
            
        }
        
        return 0
    }
    
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        if tableView == stackView {
            
            if tableColumn == stackView.tableColumns[0] {
                
                let cell = tableView.makeViewWithIdentifier("AdressCell", owner: nil) as? NSTableCellView
                cell?.textField?.stringValue = row.description
                
                return cell
                
            }
            if tableColumn == stackView.tableColumns[1] {
                
                let cell = tableView.makeViewWithIdentifier("ValueCell", owner: nil) as? NSTableCellView
                cell?.textField?.stringValue = (engine?.getStackRowContent(row))!
                
                return cell
                
            }
            
            
            
            
        }
        
        
        return nil
    }
    
    
}

