//
//  SplashViewController.swift
//  VideogameDB
//
//  Created by Talha Dayanık on 19.07.2023.
//

import UIKit

class SplashViewController: UIViewController {
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        if Reachability.isConnectedToNetwork(){
            sleep(1)
            let mainView = MainViewController(nibName: "MainViewController", bundle: nil)
            self.navigationController?.setNavigationBarHidden(true, animated: false)
            self.navigationController?.pushViewController(mainView, animated: false)
            
        }else{
            sleep(1)
            exit(0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
