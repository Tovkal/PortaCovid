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
        if certificate == nil {
            NoQRView(certificate: $certificate)
        } else {
            QRView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
