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

    var body: some View {
        ZStack {
            Color.backgroundBlue.ignoresSafeArea()
            ZStack {
                if let certificate = self.$certificate.wrappedValue {
                    QRView(certificate: certificate)
                } else {
                    NoQRView(certificate: $certificate)
                }
            }
            .frame(maxWidth: UIScreen.main.bounds.width - 80, minHeight: 400, alignment: .center)
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .accentColor(.backgroundBlue)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
