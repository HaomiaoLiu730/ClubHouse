//
//  PreviousMessagesViewController.swift
//  ClubHouse
//
//  Created by Haomiao Liu on 12/29/20.
//

import UIKit
import Firebase

class PreviousGroupsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var data: [GroupInfo] = []
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
       loadPreviousGroups()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "GroupCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
    }
    
    func loadPreviousGroups(){
        let db = Firestore.firestore()
        
        
        db.collection("messages")
            .order(by: "date")
            .addSnapshotListener { (querySnapshot, error) in
            if let _ = error{
                print("issue when getting data from messages")
            }else{
                if let documents = querySnapshot?.documents{
                    for doc in documents{
                        let data = doc.data()
                        if let sender = data["owner"] as? String, let name = data["groupName"] as? String{
                            let user = User(name: sender)
                            let group = GroupInfo(groupName: name, members: [user])
                            self.data.append(group)
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }
}


extension PreviousGroupsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! GroupCell
        let group = self.data[indexPath.row]
        cell.groupName.text = group.groupName
        
        return cell
    }
    
    
}

extension PreviousGroupsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
