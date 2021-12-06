//
//  SettingsView.swift
//  PortaCovid
//
//  Created by Andrés Pizá Bückmann on 6/12/21.
//

import SwiftUI
import EUDCC

struct SettingsView: View {

    @Binding var certificate: EUDCC?
    @State private var showSendFeedback = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                SettingsRowView(title: "Send feedback") {
                    showSendFeedback = true
                }
                if certificate != nil {
                    SettingsRowView(title: "Delete certificate", type: .destructive) {
                        certificate = nil
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationTitle("Settings")
        }
        .sheet(isPresented: $showSendFeedback) {
            showSendFeedback = false
        } content: {
            MailView(result: Binding.constant(nil))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(certificate: Binding.constant(Constants.sampleCertificate))
    }
}
