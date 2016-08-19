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
    
    @IBOutlet weak var instructionStackView: NSTableView!
    
    @IBOutlet var InputTextView: NSTextView!
    
    @IBOutlet var OutputTextView: NSTextView!
    
    var engine : Commands?
    var engineReader : Reader?
    var instructions : [(String, Int?, Int?)] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        engine = Commands(aOutputView: OutputTextView,aInputView: InputTextView)
        
        engineReader = Reader()
        
        stackView.setDelegate(self)
        stackView.setDataSource(self)
        instructionStackView.setDelegate(self)
        instructionStackView.setDataSource(self)
        
        engine?.M = [1,2,3,4,5]
        
        instructions = [("teste1",0,1),("teste2",0,nil),("teste3",nil,nil),("teste4",nil,1)]
        
        stackView.reloadData()
        instructionStackView.reloadData()
        
        //print(<#T##items: Any...##Any#>)
        
        

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
        if tableView == instructionStackView {
            
            
            
            return instructions.count
            
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
        
        
        if tableView == instructionStackView{
            
            if tableColumn == instructionStackView.tableColumns[0]{
                
                let cell = tableView.makeViewWithIdentifier("IdentifierCell", owner: nil) as? NSTableCellView
                cell?.textField?.stringValue = row.description
                
                return cell
                
                
            }
            
            if tableColumn == instructionStackView.tableColumns[1]{
                
                let cell = tableView.makeViewWithIdentifier("InstructionCell", owner: nil) as? NSTableCellView
                cell?.textField?.stringValue = instructions[row].0
                
                return cell
                
                
            }
            
            if tableColumn == instructionStackView.tableColumns[2]{
                
                let cell = tableView.makeViewWithIdentifier("Atribute1Cell", owner: nil) as? NSTableCellView
                let aux = instructions[row].1
                if aux != nil {
                     cell?.textField?.stringValue = (aux?.description)!
                }else{
                    cell?.textField?.stringValue = ""
                }
               
                
                return cell
                
                
            }
            
            if tableColumn == instructionStackView.tableColumns[3]{
                
                let cell = tableView.makeViewWithIdentifier("Atribute2Cell", owner: nil) as? NSTableCellView
                let aux = instructions[row].2
                if aux != nil {
                    cell?.textField?.stringValue = (aux?.description)!
                }else{
                    cell?.textField?.stringValue = ""
                }
                return cell
                
                
            }
            
            
        }
        
        
        
        return nil
    }
    
    
}

