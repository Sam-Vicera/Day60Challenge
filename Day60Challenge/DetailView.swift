//
//  DetailView.swift
//  Day60Challenge
//
//  Created by Samuel Hernandez Vicera on 4/9/24.
//

import SwiftUI

struct DetailView: View {
    var user: User
    var onlineStatus: String {
        if user.isActive == true { return "User is online"}
        else { return "User is currently not active"}
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                
                VStack(alignment: .leading, spacing: 25){
                    Text("User registered on: \(user.registered.formatted(date: .abbreviated, time: .omitted))")
                    
                    Text("Status: \(user.isCurrentlyActive)")
                        .font(.headline)
                    
                    Section(){
                        HStack{
                            ForEach(user.tags, id: \.self){tag in
                                
                                Text("#\(tag)")
                            }
                        }
                        
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .border(.red)
                .padding()
                
                VStack(alignment: .leading, spacing: 15){
                    Text("Age: \(user.age)")
                    Text("Email: \(user.email)")
                    Text("Company: \(user.company)")
                    Text("Address: \(user.address)")
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .border(.red)
                .padding()
                
                
                VStack{
                    Text("Bio")
                        .underline()
                    Text(user.about)
                    Spacer()
                    
                }
                .border(.red)
                .padding()
                VStack{
                    Text("Friends of User")
                        .underline()
                    VStack{
                        ForEach(user.friends, id: \.id){ friend in
                            Text("\(friend.name)")
                                
                        }
                     
                    }
                }
            }
            .navigationTitle("\(user.name)")

        }
    }
}

#Preview {
    
    DetailView(user: User(id: "testId", isActive: true, name: "Test Name", age: 22, company: "Apple", email: "testEmail@apple.com", address: "124 Test Drive", about: "Bio for display purposes when testing", registered: .now, tags: ["Test1", "Test2", "Test3"], friends: [Friends(id: "friendId", name: "Test Friend")]))
}
