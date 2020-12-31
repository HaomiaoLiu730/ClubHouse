//
//  AddUsersViewController.swift
//  ClubHouse
//
//  Created by Haomiao Liu on 12/27/20.
//

import UIKit

class AddUsersViewController: UIViewController {

    @IBAction func BackArrowPressed(_ sender: UIButton) {
        print("go back")
        self.performSegue(withIdentifier: "goToMain", sender: self)
    }
    @IBOutlet weak var FindPeopleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func EnterNameTextField(_ sender: UITextField) {
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
