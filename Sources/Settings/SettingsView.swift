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
                SettingsRowView(title: "settings.row.feedback") {
                    showSendFeedback = true
                }
                if certificate != nil {
                    SettingsRowView(title: "settings.row.delete_certificate", type: .destructive) {
                        certificate = nil
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationTitle("settings.title".localized)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.gray)
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.red)
                            .clipShape(Circle())
                    }
                }
            }
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
