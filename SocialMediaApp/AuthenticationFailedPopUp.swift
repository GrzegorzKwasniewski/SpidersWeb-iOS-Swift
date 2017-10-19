//
//  AuthenticationFailedPopUp.swift
//  SocialMediaApp
//
//  Created by Grzegorz on 17/09/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

class AuthenticationFailedPopUp: UIView {
    
    // MARK: Custom Views
    
    var blurView: BlurView = {
        return BlurView()
    }()
    
    var popUpView: RoundedView = {
        let view = RoundedView(frame: CGRect.zero)
        return view
    }()
    
    var message: WhiteTextLabel = {
        let label = WhiteTextLabel(frame: CGRect.zero)
        label.accessibilityLabel = "errorMessage"
        return label
    }()
    
    var dismissButton: RoundedButton = {
        let button = RoundedButton(frame: CGRect.zero,
                                   withTitle: "Dismiss")
        button.accessibilityLabel = "dismissButton"
        button.addTarget(self, action: #selector(dismissPopUpView(_:)), for: .touchUpInside)
        return button
    }()
    
    // MARK: Initializers
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        addAllSubviews()
        
        setupBlurView()
        setupPopUpView()
        setupMessageLabel()
        setupDismissButton()
        
        runStartAnimation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Custom Functions
    
    /**
     Add views to their's super views
     */
    
    func addAllSubviews() {
        addSubview(blurView)
        addSubview(popUpView)
        popUpView.addSubview(message)
        popUpView.addSubview(dismissButton)

    }
    
    /**
     Add constraints to blur view
    */
    
    func setupBlurView() {
        blurView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        blurView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        blurView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        blurView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    /**
     Add constraints to pop up view
    */
    
    func setupPopUpView() {
        popUpView.widthAnchor.constraint(equalToConstant: 254).isActive = true
        popUpView.heightAnchor.constraint(equalToConstant: 170).isActive = true
        popUpView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        popUpView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    /**
     Add constraints to message label
    */
    
    func setupMessageLabel() {
        message.centerXAnchor.constraint(equalTo: popUpView.centerXAnchor).isActive = true
        message.topAnchor.constraint(equalTo: popUpView.topAnchor, constant: 21).isActive = true
        message.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor, constant: 20).isActive = true
        message.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor, constant: -20).isActive = true
        message.heightAnchor.constraint(equalToConstant: 85).isActive = true
    }
    
    /**
     Add constraints to dismiss button
    */
    
    func setupDismissButton() {
        dismissButton.centerXAnchor.constraint(equalTo: popUpView.centerXAnchor).isActive = true
        dismissButton.topAnchor.constraint(equalTo: message.bottomAnchor, constant: 8).isActive = true
        dismissButton.widthAnchor.constraint(equalToConstant: 162).isActive = true
        dismissButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    /**
     Function for starting animation on views
     */
    
    func runStartAnimation() {
        blurView.opacityAnimation(reverse: false, withDuration: 0.1)
        popUpView.opacityAnimation(reverse: false, withDuration: 0.1)
    }

    
    /**
    Target function for dissmis button
     
    - Parameter sender: UIButton object that will call this method
    */
    
    func dismissPopUpView(_ sender: UIButton) {
        removeWithAnimation()
    }
    
    /**
     Function for removing pop up view from super view
    */
    
    func removeWithAnimation() {
        self.blurView.opacityAnimation(reverse: true)
        
        UIView.animate(withDuration: 0.25, animations: {
            self.popUpView.center.x += self.bounds.width
        }, completion:{(finished : Bool)  in
            if (finished) {
                self.removeFromSuperview()
            }
        })
    }
}
