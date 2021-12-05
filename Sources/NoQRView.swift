//
//  NoQRView.swift
//  PortaCovid
//
//  Created by Andrés Pizá Bückmann on 5/12/21.
//

import SwiftUI
import EUDCCDecoder

struct NoQRView: View {
    @State private var isShowingScanner = false

    var body: some View {
        VStack {
            Text("Add a certificate")
                .font(.title)
                .padding()
            Button("\(Image(systemName: "qrcode.viewfinder")) Scan a QR code") {
                isShowingScanner = true
            }
            .font(.title2)
        }
        .sheet(isPresented: $isShowingScanner) {
            isShowingScanner = false
        } content: {
            scannerView
        }
    }

    var scannerView: some View {
        CodeScannerView(
            codeTypes: [.qr],
            simulatedData: Constants.sampleQR,
            completion: self.handleScan
        )
    }

    func handleScan(result: Result<String, CodeScannerView.ScanError>) {
        isShowingScanner = false

        switch result {
        case .success(let data):
            decodeCertificate(data)
        case .failure(let error):
            print(error)
        }
    }

    func decodeCertificate(_ data: String) {
        let decoder = EUDCCDecoder()
        let decodingResult = decoder.decode(from: data)

        switch decodingResult {
        case .success(let eudcc):
            print("EU Digital COVID Certificate", eudcc)
        case .failure(let decodingError):
            print("Failed to decode EUDCC", decodingError)
        }
    }
}

struct NoQRView_Previews: PreviewProvider {
    static var previews: some View {
        NoQRView()
    }
}
