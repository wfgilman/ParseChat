//
//  ChatViewController.swift
//  ParseChat
//
//  Created by Arthur Burgin on 4/12/17.
//  Copyright © 2017 Will Gilman. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {

    @IBOutlet var messageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onSendButtonTapped(_ sender: UIButton) {
        var message = PFObject(className: "Message")
        message["text"] = messageTextField.text
        
        message.saveInBackground { (success:Bool, error:Error!) in
            if success{
                print("The message is saved")
            }else{
                print("error\(error.localizedDescription)")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
