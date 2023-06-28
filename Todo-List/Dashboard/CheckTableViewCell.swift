//
//  ChekTableViewCell.swift
//  Todo-List
//
//  Created by Aren Musayelyan on 28.06.23.
//

import UIKit

// Delegate protocol for CheckTableViewCell events
protocol CheckTableViewCellDelegate: AnyObject {
    func checkTableViewCell(_ cell: CheckTableViewCell, didChangeCheckedState checked: Bool)
}

class CheckTableViewCell: UITableViewCell {
    
    @IBOutlet weak var checkbox: Checkbox!
    @IBOutlet weak var label: UILabel!
    
    weak var delegate: CheckTableViewCellDelegate?
    
    // Action method for checkbox state change
    @IBAction func checked(_ sender: Checkbox) {
        updateChecked()
        delegate?.checkTableViewCell(self, didChangeCheckedState: checkbox.checked)
    }
    
    // Set the title and checked state of the cell
    func set(title: String, checked: Bool) {
        label.text = title
        set(checked: checked)
    }
    
    // Set the checked state of the cell
    func set(checked: Bool) {
        checkbox.checked = checked
        updateChecked()
    }
    
    // Update the visual style of the label based on the checked state
    private func updateChecked() {
        let attributedString = NSMutableAttributedString(string: label.text!)
        if label.text == "" {
            return
        }
        if checkbox.checked {
            attributedString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length-1))
        } else {
            attributedString.removeAttribute(.strikethroughStyle, range: NSMakeRange(0, attributedString.length-1))
        }
        label.attributedText = attributedString
    }
}
