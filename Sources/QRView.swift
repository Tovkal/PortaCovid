//
//  QRView.swift
//  PortaCovid
//
//  Created by Andrés Pizá Bückmann on 5/12/21.
//

import SwiftUI

struct QRView: View {
    var body: some View {
        VStack {
            QRCodeView(data: Constants.sampleQR)
            Text("Paquita Tomás")
                .font(.title3)
            Text("01/12/2000")
        }
    }
}

struct QRView_Previews: PreviewProvider {
    static var previews: some View {
        QRView()
    }
}
