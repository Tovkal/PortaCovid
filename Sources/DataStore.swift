//
//  DataStore.swift
//  PortaCovid
//
//  Created by Andrés Pizá Bückmann on 6/12/21.
//

import Foundation
import EUDCC
import EUDCCDecoder

private enum DataStoreConstants {
    static let certificateKey = "certificate"
}

class DataStore {
    static let shared = DataStore()

    private let userDefaults = UserDefaults()

    func storeCertificate(_ data: String) -> EUDCC? {
        userDefaults.set(data, forKey: DataStoreConstants.certificateKey)
        return decodeCertificate(data)
    }

    func getCertificate() -> EUDCC? {
        guard let data = userDefaults.string(forKey: DataStoreConstants.certificateKey) else {
            return nil
        }
        return decodeCertificate(data)
    }

    func deleteCertificate() {
        userDefaults.removeObject(forKey: DataStoreConstants.certificateKey)
    }

    #if DEBUG
    func preload() {
        storeCertificate(Constants.sampleQR)
    }
    #endif

    private func decodeCertificate(_ data: String) -> EUDCC? {
        let decoder = EUDCCDecoder()
        let decodingResult = decoder.decode(from: data)

        switch decodingResult {
        case .success(let eudcc):
            return eudcc
        case .failure(let decodingError):
            print("Failed to decode EUDCC", decodingError)
            return nil
        }
    }
}
