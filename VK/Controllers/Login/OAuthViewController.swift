//
//  OAuthViewController.swift
//  VK
//
//  Created by Александр Чегошев on 19.08.2018.
//  Copyright © 2018 4egoshev. All rights reserved.
//

import UIKit
import Alamofire

class OAuthViewController: VKViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
    }
    
    private func setupWebView() {
        webView.delegate = self
        getAuth()
    }
    
    func getAuth() {
        
        let scope = Scope.wall.rawValue +
                    Scope.friends.rawValue +
                    Scope.groups.rawValue +
                    Scope.photos.rawValue
        let params = AuthtorizationParams(clientID: String.clientID,
                                          redirectURI: String.authURI,
                                          display: Display.mobile.rawValue,
                                          scope: scope,
                                          responseType: String.responseType,
                                          version: String.versionAPI)
        NetworkHelper.helper.getAuth(params: params) { (request) in
            self.webView.loadRequest(request)
        }
    }
}

extension OAuthViewController: UIWebViewDelegate {
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        UIView.animate(withDuration: 0, animations: {
            ScreenManager.setNewsViewcontroller()
        }) { (completion) in
            self.dismiss(animated: true, completion: nil)
        }
        return true
    }
}
