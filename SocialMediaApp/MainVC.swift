//
//  MainVC.swift
//  SocialMediaApp
//
//  Created by serwis on 29/10/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import CoreData

class MainVC: BaseVC {
    
    // test fore Core Data
    var managedObjectContext: NSManagedObjectContext!
    
    // MARK: Properties
    
    let emailButton: RoundedButton = {
        let button = RoundedButton(withImage: #imageLiteral(resourceName: "email"))
        return button
    }()
    
    let messageLabel: CustomTextLabel = {
        let label = CustomTextLabel(withMessage: "Log In", textColor: Colors.GREY_TEXT_COLOR)
        return label
    }()
    
    let centerXView: RoundedView = {
        let view = RoundedView(frame: CGRect.zero)
        return view
    }()
    
    let centerYView: RoundedView = {
        let view = RoundedView(frame: CGRect.zero)
        return view
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
        setupMessageLabel()
        setupCenterXView()
        setupCenterYView()
        setupEmailButton()
        
    }
}

extension MainVC: ArrangeSubViews {
    
    /**
     Add all subview to the main view
     */
    
    func addAllSubViews() {
        view.addSubview(messageLabel)
        view.addSubview(emailButton)
        view.addSubview(centerXView)
        view.addSubview(centerYView)
    }
    
    /**
     Add constraints for message label view
    */
    
    func setupMessageLabel() {
        messageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        messageLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    /**
     Add constraints for center X view
     */
    
    func setupCenterXView() {
        centerXView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        centerXView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        centerXView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    /**
     Add constraints for center Y view
     */
    
    func setupCenterYView() {
        centerYView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        centerYView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        centerYView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    /**
     Add constraints for email button
     */
    
    func setupEmailButton() {
        emailButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        emailButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        emailButton.trailingAnchor.constraint(equalTo: centerXView.leadingAnchor, constant: 10).isActive = true
        emailButton.bottomAnchor.constraint(equalTo: centerYView.topAnchor, constant: 10).isActive = true
    }
}

protocol ArrangeSubViews {
    func addAllSubViews()
    func setupMessageLabel()
}
