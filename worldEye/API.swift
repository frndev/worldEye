//
//  API.swift
//  worldEye
//
//  Created by Fran Navarro on 31/10/16.
//  Copyright © 2016 frndev. All rights reserved.
//

import Foundation
import CommonCrypto

public struct API {
    
    static private func oAuthString() -> String {
        let nonce = UUID().uuidString.data(using: .unicode)?.base64EncodedString()
        let timestamp = Int(Date().timeIntervalSince1970)
        let signature = "LYvuZpJPxwo1OHOzsGc1PMFSZ3BlnaXsz8AsCelkdWI6KNUBCV&tFBfLsOBjKgYyPYT4I2icq6GNhYcQYxryfZ2wvDt0rRl1"
        let oAuth_signature = "GET&https%3A%2F%2Fstream.twitter.com%2F1.1%2Fstatuses%2Fsample.json%26oauth_consumer_key%3DfAOYkfT2t4MGDcQtDn8m82e0t%26oauth_nonce%3DkYjzVBB8Y0ZFabxSWbWovY3uYSQ2pTgmZeNu2VS4cg%26oauth_signature_method%3DHMAC-SHA1%26oauth_timestamp%3D\(timestamp)%26oauth_token%3D785387563955650560-u159KcJxZJeS9pYju6C8ALqYweHyqsq%26oauth_version%3D1.0".hmac(algorithm: .SHA1, key: signature)
        
        let oAuth = "oAuth oauth_consumer_key=\"fAOYkfT2t4MGDcQtDn8m82e0t\", oauth_nonce=\"kYjzVBB8Y0ZFabxSWbWovY3uYSQ2pTgmZeNu2VS4cg\", oauth_signature=\"\(oAuth_signature)\", oauth_signature_method=\"HMAC-SHA1\", oauth_timestamp=\"\(timestamp)\", oauth_token=\"785387563955650560-u159KcJxZJeS9pYju6C8ALqYweHyqsq\", oauth_version=\"1.0\""
        
        
        return oAuth
        
    }
    
    static func makeRequest(url : URL) -> URLRequest {
        
        var request = URLRequest(url: url)
        
        request.setValue(oAuthString(), forHTTPHeaderField: "Authorization")
        
        return request
    }
    
    
}
