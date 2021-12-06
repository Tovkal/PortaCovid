//
//  QRView.swift
//  PortaCovid
//
//  Created by Andrés Pizá Bückmann on 5/12/21.
//

import SwiftUI
import EUDCC

struct QRView: View {

    let certificate: EUDCC
    private var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        return dateFormatter
    }()

    init(certificate: EUDCC) {
        self.certificate = certificate
    }

    var body: some View {
        VStack {
            Text("qr.title".localized)
                .font(.title)
            QRCodeView(data: certificate.base45Representation)
            Text("\(certificate.name.lastName ?? "")")
                .font(.title3)
                .fontWeight(.bold)
            Text("\(certificate.name.firstName ?? "")")
                .font(.title3)
                .fontWeight(.bold)
            Spacer()
                .frame(height: 10)
            Text(certificate.dateOfBirth, formatter: dateFormatter)
        }
    }
}

struct QRView_Previews: PreviewProvider {
    static var previews: some View {
        QRView(certificate: Constants.sampleCertificate)
    }
}
