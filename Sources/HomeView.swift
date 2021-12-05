//
//  HomeView.swift
//  PortaCovid
//
//  Created by Andrés Pizá Bückmann on 1/12/21.
//

import SwiftUI

struct HomeView: View {

    private var haveQR = false
    private var qrView = QRView()
    private var noQRView = NoQRView()

    var body: some View {
        if haveQR {
            qrView
        } else {
            noQRView
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
