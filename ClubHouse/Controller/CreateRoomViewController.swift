//
//  MessageViewController.swift
//  ClubHouse
//
//  Created by Haomiao Liu on 12/29/20.
//

import UIKit
import FirebaseAuth
import Firebase

class CreateRoomViewController: UIViewController {
    let db = Firestore.firestore()

    @IBOutlet weak var groupNameTextField: UITextField!

    @IBAction func sendPressed(_ sender: UIButton) {
        if let text = groupNameTextField.text, let sender = Auth.auth().currentUser?.email{
            groupNameTextField.text = ""
            db.collection("messages").addDocument(data: ["owner":sender, "groupName": text, "date":Date().timeIntervalSince1970]) { (error) in
                if let e = error{
                    print(e)
                }else{
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
