//
//  SLLoginViewController.swift
//  iSYSULibrary
//
//  Created by Alaysh on 8/31/14.
//  Copyright (c) 2014 Alaysh. All rights reserved.
//

import UIKit

class SLLoginViewController: UIViewController {
    
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
    
    func configureAppearence() {
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        usernameField.alpha = 0.0
        passwordField.alpha = 0.0
        loginButton.alpha = 0.0
        usernameField.textColor = UIColor.lightGrayColor()
        passwordField.textColor = UIColor.lightGrayColor()
        UIView.animateWithDuration(0.7, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.usernameField.alpha = 1.0
            self.passwordField.alpha = 1.0
            self.loginButton.alpha = 0.9
        }, completion: nil)
        usernameField.addTarget(self, action: "textFieldDidChange", forControlEvents: UIControlEvents.EditingChanged)
        passwordField.addTarget(self, action: "textFieldDidChange", forControlEvents: UIControlEvents.EditingChanged)
        textFieldDidChange()
    }
    
    
    func textFieldDidChange() {
        if usernameField.text.isEmpty || passwordField.text.isEmpty {
            loginButton.enabled = false
            UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                self.loginButton.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.5)
                }, completion: nil)
        }
        else {
            UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.loginButton.backgroundColor = UIColor.applicationGreenColor()
                }, completion: nil)
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
        performSegueWithIdentifier("didLogIn", sender: self)
    }
}

