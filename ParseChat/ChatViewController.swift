//
//  ChatViewController.swift
//  ParseChat
//
//  Created by Arthur Burgin on 4/12/17.
//  Copyright © 2017 Will Gilman. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var messageTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var localMessages = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100.0
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ChatViewController.refreshMessage), userInfo: nil, repeats: true)

        // Do any additional setup after loading the view.
    }

    @IBAction func onSendButtonTapped(_ sender: UIButton) {
        var message = PFObject(className: "Message")
        message["text"] = messageTextField.text
        
        message.saveInBackground { (success: Bool, error: Error?) in
            if (success) {
                print("The message is saved!")
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        cell.chatMessageLabel.text = "Chat message"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func refreshMessage() {
//        var message = PFObject(className: "Message")
        var query = PFQuery(className: "Message")
        query.findObjectsInBackground { (messages: [PFObject]?, error: Error?) in
            if error == nil && messages != nil {
                for message in messages {
                    localMessages.append(message["text"])
                }
            }
        }
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
