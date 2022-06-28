//
//  TasksTableViewCell.swift
//  LuftbornTask
//
//  Created by Ahmed on 6/28/22.
//

import UIKit

class TasksTableViewCell: UITableViewCell {
    
    //MARK:- var & let properties
    // cell identifier
    static let cellID = "TasksTableViewCell"
    
    //MARK:- Outlet properties
    @IBOutlet weak var dateLabelOutlet: UILabel!
    @IBOutlet weak var taskNameLabelOutlet: UILabel!
    
    //MARK:- awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }
    
    //MARK:- SetSelected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //MARK:- Configure and set data into UI element => labels and use it in cellForRawAt in ViewController
    func configure(model: TasksModel) {
        dateLabelOutlet.text = model.StringDate
        taskNameLabelOutlet.text = model.taskName
    }
    
}
