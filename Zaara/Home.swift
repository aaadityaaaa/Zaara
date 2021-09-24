//
//  Home.swift
//  Zaara
//
//  Created by Aaditya Singh on 22/08/21.
//

import SwiftUI
import FirebaseAuth

struct Home: View {
    @EnvironmentObject var viewModel: HomeViewModel
    @State private var showingMenuView = false
    
    var body: some View {
        VStack {
            if viewModel.signedIn {
            Text("ZARA")
                .font(Font.custom("Didot", size: 80))
            Image("IMG")
                .padding()
            Spacer()
                
                Button(action: {self.showingMenuView.toggle()}, label: {
                    Text("MENU")
                        .font(.body)
                        .foregroundColor(.white)
                        .padding()
                        .clipShape(Rectangle())
                        .frame(width: 600)
                        .background(Color.black)
                        .padding()
                })
                .sheet(isPresented: $showingMenuView, content: {
                    Menu()
                })
                .padding()
                Button(action: {viewModel.signOut()}, label: {
                    Text("Sign Out")
                        .font(.body)
                        .foregroundColor(.white)
                        .padding()
                        .clipShape(Rectangle())
                        .frame(width: 600)
                        .background(Color.black)
                    
                })
            
                
            }
            
            else {
               SigningIn()
            }
        }
        .onAppear{
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}


struct SigningIn: View {
    
    @State private var email = ""
    @State private var pass = ""
    @EnvironmentObject var viewModel: HomeViewModel
    @State private var shwoingRegisterView = false
    
    var body: some View {
        
        VStack {
            
            Text("LOG IN")
                .font(.largeTitle)
                .fontWeight(.medium)
                .padding()
            Text("EMAIL")
                .font(.caption)
                .fontWeight(.medium)
               
            
            TextField("enter your email", text: $email)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
            
            Text("PASSWORD")
                .font(.caption)
                .fontWeight(.medium)
            SecureField("enter your password", text: $pass)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
            Button(action: {
                guard !email.isEmpty, !pass.isEmpty else{return}
                viewModel.signIn(email: email, pass: pass)}, label: {
                Text("LOG IN")
                    .padding()
                    .foregroundColor(.white)
                    .clipShape(Rectangle())
                    .frame(width: 350)
                    .background(Color.black)
            })
            
            Button(action: {self.shwoingRegisterView.toggle()}, label: {
                Text("CREATE ACCOUNT")
                    .font(.body)
                    .foregroundColor(.white)
                    .padding()
                    .clipShape(Rectangle())
                    .frame(width: 600)
                    .background(Color.black)
                    .padding()
            })
            .sheet(isPresented: $shwoingRegisterView, content: {
                SigningUp()
            })
            
            Spacer()
        }
        
    }
}




struct SigningUp: View {
    
    @State private var email = ""
    @State private var pass = ""
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            Text("REGISTER")
                .font(.largeTitle)
                .fontWeight(.medium)
                .padding()
            
            Text("EMAIL")
                .font(.caption)
                .fontWeight(.medium)
            
            TextField("enter your email", text: $email)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
            
            Text("PASSWORD")
                .font(.caption)
                .fontWeight(.medium)
            
            SecureField("enter your password", text: $pass)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
            
            Button(action: {
                guard !email.isEmpty, !pass.isEmpty else {return}
                viewModel.signUp(email: email, pass: pass)
            }, label: {
                Text("Create Account")
                    .padding()
                    .foregroundColor(.white)
                    .clipShape(Rectangle())
                    .frame(width: 350)
                    .background(Color.black)
            })
            Spacer()
        }
    }
}








struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
