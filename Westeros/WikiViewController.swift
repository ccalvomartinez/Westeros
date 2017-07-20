//
//  WikiViewController.swift
//  Westeros
//
//  Created by Administrador on 17/7/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController {

    let model: House
    
    @IBOutlet weak var browserView: UIWebView!
    
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    init(model: House){
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func syncViewWithModel(){
        
        activityView.isHidden = false
        activityView.startAnimating()
        
        title = model.name
        browserView.delegate = self
        browserView.loadRequest(URLRequest(url: model.wiki))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        syncViewWithModel()
    }
}


extension WikiViewController: UIWebViewDelegate{
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activityView.stopAnimating()
        activityView.isHidden=true
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        switch navigationType {
            case .linkClicked, .formSubmitted:
                return false
            default:
                return true
        }
        
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        // TODO: Implementar: Mostrar el mensaje de error
    }
}
