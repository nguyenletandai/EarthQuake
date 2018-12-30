//
//  webViewController.swift
//  EarthQuake
//
//  Created by daicudu on 12/27/18.
//  Copyright © 2018 daicudu. All rights reserved.
//

import UIKit
import WebKit

class webViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var urlOfRow = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.webView.addSubview(webView)
        if let url = URL(string: urlOfRow) {
            webView.load(URLRequest(url: url))
        }
        

        // Do any additional setup after loading the view.
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
