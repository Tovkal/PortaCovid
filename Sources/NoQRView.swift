//
//  NoQRView.swift
//  PortaCovid
//
//  Created by Andrés Pizá Bückmann on 5/12/21.
//

import SwiftUI

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
            simulatedData: "HC1:6BFOXN*TS0BI$ZD4N9:9S6RCVN5+O30K3/XIV0W23NTDEPWK G2EP4J0B3KLASMUG8GJL8LLG.3SA3/-2E%5VR5VVBJZILDBZ8D%JTQOL2009UVD0HX2JN*4CY009TX/9F/GZ%5U1MC82*%95HC2FCG2K80H-1GW$5IKKQJO0OPN484SI4UUIMI.J9WVHWVH+ZE/T9MX1HRIWQHCR2HL9EIAESHOP6OH6MN9*QHAO96Y2/*13A5-8E6V59I9BZK6:IR/S09T./0LWTHC0/P6HRTO$9KZ56DE/.QC$QUC0:GOODPUHLO$GAHLW 70SO:GOV636*2. KOKGKZGJMI:TU+MMPZ5OV1 V125VE-4RZ4E%5MK9BM57KPGX7K:7D-M1MO0Q2AQE:CA7ED6LF90I3DA+:E3OGJMSGX8+KL1FD*Y49+574MYKOE1MJ-69KKRB4AC8.C8HKK9NTYV4E1MZ3K1:HF.5E1MRB4WKP/HLIJL8JF8JF172M*8OEB2%7OREF:FO:7-WF11SKCU1MH8FWPVH%L635OBXTY*LPM6B9OBYSH:4Q1BQ:A5+I6:DQR9VKR8 BLHCFQMZA5:PHR14%GV4ZOP50$ A 3",
            completion: self.handleScan
        )
    }

    func handleScan(result: Result<String, CodeScannerView.ScanError>) {
        isShowingScanner = false

        switch result {
        case .success(let data):
            print(data)
        case .failure(let error):
            print(error)
        }
    }
}

struct NoQRView_Previews: PreviewProvider {
    static var previews: some View {
        NoQRView()
    }
}
