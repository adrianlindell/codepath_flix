//
//  trailerViewController.swift
//  flixapp
//
//  Created by Adrian Lindell on 4/16/21.
//

import UIKit
import WebKit

class trailerViewController: UIViewController, WKUIDelegate {
    var webView: WKWebView!
    var trailerUrl: String = ""
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let myUrl = URL(string: "https://www.youtube.com/watch?v=" + trailerUrl)
        let myRequest = URLRequest(url: myUrl!)
        webView.load(myRequest)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
