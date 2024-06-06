//
//  ContentView.swift
//  Day60Challenge
//
//  Created by Samuel Hernandez Vicera on 4/9/24.
//

import SwiftData
import SwiftUI



struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationStack{
            List(users) {user in
                NavigationLink(destination: DetailView(user: user)){
                    VStack{
                        HStack{
                            Text("\(user.name)")
                            Spacer()
                            Text(user.isActive ? "🟢" : "🔴")
                            
                        }
                        
                    }
                }
            }
            .task {
                await loadUsers()
            }
            .navigationTitle("Users & Friends")
        }
    }
    
    func loadUsers() async {
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid Url")
            return }
        
        
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let userDecoder = JSONDecoder()
            userDecoder.dateDecodingStrategy = .iso8601
            
            users = try userDecoder.decode([User].self, from: data)
        } catch {
            print("Error loading users: \(error.localizedDescription)")
        }
    }
    
}


#Preview {
    ContentView()
}
