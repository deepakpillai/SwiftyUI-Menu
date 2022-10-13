//
//  Profile.swift
//  UI19
//
//  Created by Deepak on 12/10/22.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 300, height: 300)
                .foregroundColor(.orange)
            Text("Profile")
                .bold()
                .font(.system(size: 30))
                .foregroundColor(.white)
        }
    }
}

struct Settings: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 300, height: 300)
                .foregroundColor(.orange)
            Text("Settings")
                .bold()
                .font(.system(size: 30))
                .foregroundColor(.white)
        }
    }
}

struct Logout: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 300, height: 300)
                .foregroundColor(.orange)
            Text("Logout")
                .bold()
                .font(.system(size: 30))
                .foregroundColor(.white)
        }
    }
}
