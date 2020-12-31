//
//  GroupInfo.swift
//  ClubHouse
//
//  Created by Haomiao Liu on 12/27/20.
//

import Foundation

struct GroupInfo{
    var groupName: String
    var members: [User]
    var numberOfMessages: Int
    var numberOfMembers: Int
    init(groupName: String, members: [User]){
        self.groupName = groupName
        self.members = members
        self.numberOfMessages = 0
        self.numberOfMembers = 0
    }
}

struct User{
    var name: String
}
