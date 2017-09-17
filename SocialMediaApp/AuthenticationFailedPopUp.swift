//
//  AuthenticationFailedPopUp.swift
//  SocialMediaApp
//
//  Created by Grzegorz on 17/09/2017.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

class AuthenticationFailedPopUp: UIView {
    
    // MARK: Class Properties
    
    var message: UILabel!
    var nextQuestionButton: RoundedButton!
    var summaryButton: RoundedButton!
    var popUpView: RoundedView!
    var blurView: UIVisualEffectView!
    
    weak var delegate: ShowPopUp?
    
    // MARK: Initializers
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurView)
        
        popUpView = RoundedView(frame: self.frame)
        popUpView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(popUpView)
        
        popUpView.widthAnchor.constraint(equalToConstant: 254).isActive = true
        popUpView.heightAnchor.constraint(equalToConstant: 170).isActive = true
        popUpView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        popUpView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        message = UILabel(frame: CGRect.zero)
        message.text = "Wrong answer"
        message.textColor = UIColor.white
        message.font = UIFont(name: "Avenir-Heavy", size: 18.0)
        message.textAlignment = .center
        message.translatesAutoresizingMaskIntoConstraints = false
        popUpView.addSubview(message)
        
        message.centerXAnchor.constraint(equalTo: popUpView.centerXAnchor).isActive = true
        message.topAnchor.constraint(equalTo: popUpView.topAnchor, constant: 21).isActive = true
        message.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor, constant: 0).isActive = true
        message.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor, constant: 0).isActive = true
        message.heightAnchor.constraint(equalToConstant: 85).isActive = true
        
        summaryButton = RoundedButton(frame: CGRect.zero)
        summaryButton.setTitle("Summary", for: .normal)
        summaryButton.setTitleColor(Colors.GREY_TEXT_COLOR, for: .normal)
        summaryButton.layer.backgroundColor = Colors.MAIN_COLOR_DARKER.cgColor
        summaryButton.addTarget(self, action: #selector(showSummary(_:)), for: .touchUpInside)
        summaryButton.translatesAutoresizingMaskIntoConstraints = false
        popUpView.addSubview(summaryButton)
        
        summaryButton.centerXAnchor.constraint(equalTo: popUpView.centerXAnchor).isActive = true
        summaryButton.topAnchor.constraint(equalTo: message.bottomAnchor, constant: 8).isActive = true
        summaryButton.widthAnchor.constraint(equalToConstant: 162).isActive = true
        summaryButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        nextQuestionButton = RoundedButton(frame: CGRect.zero)
        nextQuestionButton.setTitle("Next question", for: .normal)
        nextQuestionButton.setTitleColor(Colors.GREY_TEXT_COLOR, for: .normal)
        nextQuestionButton.layer.backgroundColor = Colors.MAIN_COLOR_DARKER.cgColor
        nextQuestionButton.addTarget(self, action: #selector(nextQuestion(_:)), for: .touchUpInside)
        nextQuestionButton.translatesAutoresizingMaskIntoConstraints = false
        popUpView.addSubview(nextQuestionButton)
        
        nextQuestionButton.centerXAnchor.constraint(equalTo: popUpView.centerXAnchor).isActive = true
        nextQuestionButton.topAnchor.constraint(equalTo: message.bottomAnchor, constant: 8).isActive = true
        nextQuestionButton.widthAnchor.constraint(equalToConstant: 162).isActive = true
        nextQuestionButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        
        blurView.opacityAnimation(reverse: false, withDuration: 0.1)
        popUpView.opacityAnimation(reverse: false, withDuration: 0.1)
        
        nextQuestionButton.isHidden = true
        summaryButton.isHidden = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Custom Functions
    
    func nextQuestion(_ sender: Any) {
        removeWithAnimation()
    }
    
    func showSummary(_ sender: Any) {
        delegate?.showSummaryPopUp(quizCompleted: false)
        removeWithAnimation()
    }
    
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
