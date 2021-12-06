//
//  HomeView.swift
//  PortaCovid
//
//  Created by Andrés Pizá Bückmann on 1/12/21.
//

import SwiftUI
import EUDCC

struct HomeView: View {

    @State var certificate: EUDCC?
    @State private var isShowingSettings = false

    init() {
        _certificate = State(initialValue: DataStore.shared.getCertificate())
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundBlue.ignoresSafeArea()
                ZStack {
                    if let certificate = self.$certificate.wrappedValue {
                        QRView(certificate: certificate)
                    } else {
                        NoQRView(certificate: $certificate)
                    }
                }
                .frame(maxWidth: UIScreen.main.bounds.width - 60, minHeight: 400, alignment: .center)
                .background(Color.white)
                .cornerRadius(15)
                .accentColor(.backgroundBlue)
            }
            .ignoresSafeArea()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isShowingSettings = true
                    } label: {
                        Image(systemName: "gearshape.fill")
                    }
                    .sheet(isPresented: $isShowingSettings, onDismiss: {
                        isShowingSettings = false
                    }, content: {
                        SettingsView(certificate: $certificate)
                    })
                    .accentColor(.white)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
