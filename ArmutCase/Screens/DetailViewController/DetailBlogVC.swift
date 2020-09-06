//
//  DetailBlogVC.swift
//  ArmutCase
//
//  Created by Dağhan KILIÇAY on 6.09.2020.
//  Copyright © 2020 Dağhan KILIÇAY. All rights reserved.
//

import UIKit
import WebKit

class DetailBlogVC: BaseVC,WKNavigationDelegate {

    @IBOutlet weak var btnBack: UIButton!
//    @IBOutlet weak var imgHeader: UIImageView!
    @IBOutlet weak var webView: WKWebView!
    var post : Post?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnBack.addTarget(self, action: #selector(self.dismissViewController), for: .touchUpInside)
        let statusBarHeight = self.getStatusBarHeight()
        self.webView.frame = CGRect(x: 0, y:statusBarHeight , width: screen().width, height: screen().height - statusBarHeight)
        self.webView.navigationDelegate = self
        self.setPage()
    }
    
    private func setPage(){
        if post != nil{
            self.loadWebView(urlStr: post!.link)
            self.hideProgress()
        }else{
            self.showAlertMessage(message: "Beklenmedik bir hata oluştu")
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    private func loadWebView(urlStr:String){
        let request = URLRequest(url:URL(string: urlStr)!)
        webView.load(request)
    }
    
    @objc private func dismissViewController(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {

        if navigationAction.navigationType == WKNavigationType.linkActivated {
            if let url = navigationAction.request.url,
                UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
                decisionHandler(.cancel)
            } else {
                decisionHandler(.allow)
            }
        }else{
            decisionHandler(.allow)
        }
    }
}
