//
//  SLLoginViewController.swift
//  iSYSULibrary
//
//  Created by Alaysh on 8/31/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

import UIKit

class SLLoginViewController: UIViewController {
                            
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearence()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func configureAppearence() {
        usernameField.alpha = 0.0
        passwordField.alpha = 0.0
        loginButton.alpha = 0.0
        usernameField.textColor = UIColor.whiteColor()
        passwordField.textColor = UIColor.whiteColor()
        UIView.animateWithDuration(0.7, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.usernameField.alpha = 1.0
            self.passwordField.alpha = 1.0
            self.loginButton.alpha = 0.9
        }, completion: nil)
        usernameField.addTarget(self, action: "textFieldDidChange", forControlEvents: UIControlEvents.EditingChanged)
        passwordField.addTarget(self, action: "textFieldDidChange", forControlEvents: UIControlEvents.EditingChanged)
        var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Light))
        visualEffectView.frame = view.frame
        visualEffectView.alpha = 0.8
        imageView.image = UIImage(named: "background")
        imageView.addSubview(visualEffectView)
        textFieldDidChange()
    }
    
    
    func textFieldDidChange() {
        if usernameField.text.isEmpty || passwordField.text.isEmpty {
            loginButton.backgroundColor = UIColor.lightGrayColor()
            loginButton.enabled = false
        }
        else {
            loginButton.backgroundColor = UIColor.applicationGreenColor()
            loginButton.enabled = true
        }
    }
    
    @IBAction func backgroundClicked(sender: AnyObject) {
        usernameField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
    
    @IBAction func loginButtonClicked(sender: AnyObject) {
        usernameField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
}

