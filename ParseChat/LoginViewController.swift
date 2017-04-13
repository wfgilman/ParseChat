//
//  LoginViewController.swift
//  ParseChat
//
//  Created by Will Gilman on 4/12/17.
//  Copyright © 2017 Will Gilman. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.didTapScreen))
        view.addGestureRecognizer(recognizer)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        var user = PFUser()
        user.username = email.text // ?? "No name"
        user.password = password.text // ?? "s3cret"
        user.email = email.text // ?? "No email"
        // other fields can be set just like with PFObject
        user["phone"] = "415-392-0202"
        
        user.signUpInBackground { (status: Bool, error: Error?) in
            if error != nil {
                let alertController = UIAlertController(title: "Sign Up", message: "Sign up failed", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(alertAction)
                self.present(alertController, animated: true, completion: nil)
            } else {
                // Hooray! Let them use the app now.
            }
        }
        
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
     
        PFUser.logInWithUsername(inBackground: email.text!, password: password.text!) { (user: PFUser?, error:Error?) in
            if user != nil {
                // Segue to login screen
            } else {
                let alertController = UIAlertController(title: "Login Failed", message: "Invalid credentials", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(alertAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    func didTapScreen(sender: UIGestureRecognizer) {
        self.resignFirstResponder()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
