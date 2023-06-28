//
//  Checkbox.swift
//  Todo-List
//
//  Created by Aren Musayelyan on 28.06.23.
//

import UIKit

@IBDesignable
class Checkbox: UIControl {
    
    private weak var imageView: UIImageView!
    
    private var image: UIImage {
        // Return the appropriate image based on the checked state
        return checked ? UIImage(systemName: "checkmark.square.fill")! : UIImage(systemName: "square")!
    }
    
    @IBInspectable
    public var checked: Bool = false {
        didSet {
            // Update the image view with the appropriate image
            imageView.image = image
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        // Create and configure the image view
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        
        // Set up constraints to make the image view fill the control's bounds
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        self.imageView = imageView
        
        backgroundColor = UIColor.clear
        
        // Add a target for the touchUpInside event
        addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
    }
    
    @objc func touchUpInside() {
        // Toggle the checked state and send the valueChanged event
        checked = !checked
        sendActions(for: .valueChanged)
    }
}
