//
//  ViewController.swift
//  ClubHouse
//
//  Created by Haomiao Liu on 12/27/20.
//

import UIKit
import Firebase

class MainViewController: UIViewController {
    
    var groups: [GroupBlock] = [
        GroupBlock(groupName: "Group One", numberOfMessages: 10, numberOfMembers: 1, members: [User(name: "Alice")]),
        GroupBlock(groupName: "Group Two", numberOfMessages: 20, numberOfMembers: 2, members: [User(name: "Alice"), User(name: "Bob")]),
        GroupBlock(groupName: "Group Three", numberOfMessages: 30, numberOfMembers: 3, members: [User(name: "Alice"), User(name: "Bob"), User(name: "Cindy")])
    ]

    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        let firebathAuth = Auth.auth()
        do{
            try firebathAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        }catch let signOutErr as NSError{
            print("Error signing out: %@",signOutErr)
        }
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Ruby"
        navigationItem.hidesBackButton = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "GroupCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }
    
    
    @IBAction func addUsersPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToAddUsers", sender: self)
    }
    
    @IBAction func settingPressed(_ sender: UIButton) {
    }
    @IBAction func messagePressed(_ sender: UIButton) {
    }

    @IBAction func notificationPressed(_ sender: UIButton) {
    }
    @IBAction func startRoomPressed(_ sender: UIButton) {
    }

}

extension MainViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! GroupCell
        let block = groups[indexPath.row]
        cell.groupName.text = block.groupName
        cell.numberOfMembers.text = "\(block.numberOfMembers)"
        cell.numberOfMessages.text = "\(block.numberOfMessages)"
        
        if(block.members.count == 1){
            cell.firstPerson.text = block.members[0].name
            cell.imageOne.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        }else if(block.members.count == 2){
            cell.firstPerson.text = block.members[0].name
            cell.secondPerson.text = block.members[1].name
            cell.imageOne.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
            cell.imageTwo.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        }else{
            cell.firstPerson.text = block.members[0].name
            cell.secondPerson.text = block.members[1].name
            cell.thirdPerson.text = block.members[2].name
            cell.imageOne.backgroundColor = #colorLiteral(red: 0.003229152178, green: 0.7321355343, blue: 1, alpha: 1)
            cell.imageTwo.backgroundColor = #colorLiteral(red: 0.7987653613, green: 0.4091932476, blue: 0.9064561725, alpha: 1)
        }
        return cell
    }
}

extension MainViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
