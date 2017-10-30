//
//  MainVC.swift
//  SocialMediaApp
//
//  Created by serwis on 29/10/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit

class MainVC: BaseVC {
    
    var constraints: [NSLayoutConstraint]!
    
    // MARK: Properties
    
    let messageLabel: CustomTextLabel = {
        let label = CustomTextLabel(withMessage: "Log In", textColor: Colors.GREY_TEXT_COLOR)
        return label
    }()
    
    // MARK: Initializers
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View State

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAllSubViews()
        
        messageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        messageLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        constraints = view.constraints
        
        // wiesz jak się do nich dostać - ale jak je określić?
        // no bo przecież wiesz, że pierwszy jest górny constranint bo to ba hama sprawdziłeś
        // kolejność w tablicy jest taka sama jak kolejność ich dodania
        
        for con in constraints where con.constant == 20
            && con.firstAnchor == messageLabel.leadingAnchor
            && con.secondAnchor == view.leadingAnchor {
            print("README: \(con)")
            print("README: \(con.firstAnchor)")
        }
        
        let some = constraints.filter { return $0.constant == 20 && $0.firstAnchor == messageLabel.leadingAnchor
        }
        
        print("README222: \(some)")
        
        print("README: \(constraints.count)")
        print("README: \(constraints[0].firstItem)")
        print("README: \(constraints[0].secondItem!)")
        print("README: \(constraints[0].constant)")
        
        print("README: \(constraints[1].firstItem)")
        print("README: \(constraints[1].secondItem!)")
        print("README: \(constraints[1].constant)")

    }
}

extension MainVC: AddSubViews {
    
    func addAllSubViews() {
        view.addSubview(messageLabel)
    }
    
}

protocol AddSubViews {
    func addAllSubViews()
}
