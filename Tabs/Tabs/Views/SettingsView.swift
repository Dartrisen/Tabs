//
//  SettingsView.swift
//  Tabs
//
//  Created by Dartrisen on 03.10.2020.
//

import SwiftUI

func getBuildNumber() -> String {
    let buildNumber = Bundle.main.object(forInfoDictionaryKey:
                                        "CFBundleVersion") as! String
    return buildNumber
}

struct SettingsView: View {
    var body: some View {
        Form {
            GeneralSection()
            InfoSection()
            AboutSection()
        }
    }
}

struct GeneralSection: View {
    var body: some View {
        Section(header: Text("General")) {
            NavigationLink(
                destination: Text("My account"),
                label: {
                    HStack {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.blue)
                        Text("Account")
                        Spacer()
                        Text("Configure")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
            })
        }
    }
}

struct InfoSection: View {
    var body: some View {
        Section(header: Text("Info")) {
            NavigationLink(
                destination: Text("My contact"),
                label: {
                    HStack {
                        Image(systemName: "mail")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.blue)
                        Text("Contact me")
                    }
                })
        }
    }
}

struct AboutSection: View {
    let buildNumber = getBuildNumber()
    
    var body: some View {
        Section(header: Text("About")) {
            HStack {
                Text("Version")
                Spacer()
                Text("#" + buildNumber)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
