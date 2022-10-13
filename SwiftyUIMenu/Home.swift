//
//  Home.swift
//  UI19
//
//  Created by Deepak on 12/10/22.
//

import SwiftUI

struct Home: View {
    @State var isMenuShown: Bool = false
    @State var isUserLoggedIn: Bool = true
    
    var body: some View {
        NavigationView {
            //NavigationLink(destination: Profile(), isActive: $profileLinkTapped) {}
            ZStack {
                if isMenuShown {
                    
                    Menu(isMenuShown: $isMenuShown, menuItems: self.getMenuItems())
                }
                
                if isUserLoggedIn {
                    HomeView()
                        .cornerRadius(isMenuShown ? 20 : 0)
                        .offset(x: isMenuShown ? 300 : 0, y: isMenuShown ? 50 : 0)
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                        .ignoresSafeArea()
                        .scaleEffect(isMenuShown ? 0.9 : 1)
                        .navigationBarHidden(isMenuShown ? true : false)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -10, y: 10)
                        .toolbar{
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button{
                                    toggleMenu()
                                } label: {
                                    Image(systemName: "filemenu.and.selection")
                                        .foregroundColor(.black)
                                        .font(.system(size: 18))
                                }
                            }
                        }
                        .onTapGesture {
                            if isMenuShown {
                                toggleMenu()
                            }
                        }
                } else {
                    VStack {
                        Text("User Logged out")
                        Button{
                            self.isUserLoggedIn = true
                        }label: {
                            Text("Login")
                        }
                    }.navigationBarHidden(true)
                }
            }.onAppear {
                isMenuShown = false
            }
        }
    }
    
    func logout() {
        self.isUserLoggedIn = false
    }
    
    func toggleMenu() {
        withAnimation(.spring()) {
            self.isMenuShown.toggle()
        }
    }
    
    func getMenuItems() -> [MenuItem] {
        
        let array = [
            //Using didTap: you will get the tap-call-back. You can make use it implement custome events
            //Example: using sf symbols and didtap closure
            MenuItem(text: "Home", textColor: .white, sfIconName: "house.circle", sfIconForgroundColor: .white, didTap: {
                self.toggleMenu()
            }),
            
            //By padding destinationObject as AnyView will help to navigate to different views
            //Two exaples below
            MenuItem(text: "Profile", textColor: .white, sfIconName: "person.crop.circle", sfIconForgroundColor: .white, destinationObject: AnyView(Profile())),
            
            //Example: using sf symbols and didtap closure
            MenuItem(text: "Logout", textColor: .white, sfIconName: "rectangle.portrait.and.arrow.right", sfIconForgroundColor: .white, didTap: {
                self.toggleMenu()
                self.logout()
            }),
            
            //Below example shows how to display a menu item without any action attach to it
            //Below example shoes how to use custom icon in menu
            MenuItem(text: "No event menu item", textColor: .white, iconImageName: "apple", iconImageWidth: 40.0, iconImageHeight: 40.0),
            
            //Example of showing menu item without icon
            MenuItem(text: "Menu item with no icon", textColor: .white, noIconRequired: true, destinationObject: AnyView(Settings()))
        ]
        
        return array
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct HomeView: View {
    
    var body: some View {
        ZStack {
            Color(.white)
            VStack {
                Text("Hello World!")
            }
        }
    }
}
