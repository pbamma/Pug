//
//  BaseViewController.swift
//  Pug
//
//  Created by Philip Starner on 1/25/18.
//  Copyright © 2018 Philip Starner. All rights reserved.
//

import UIKit

import UIKit

class BaseViewController: UIViewController {
    var imageBackgroundView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func setupBackground() {
        let rect = CGRect(x: 0, y: 0, width: Constants.ScreenSize.SCREEN_WIDTH, height: Constants.ScreenSize.SCREEN_HEIGHT)
        
        if self.imageBackgroundView == nil {
            self.imageBackgroundView = UIImageView(frame: rect)
            self.imageBackgroundView?.image = UIImage(named: "background")
            self.imageBackgroundView?.contentMode = .scaleAspectFill
            self.imageBackgroundView?.layer.masksToBounds = true
            self.view.insertSubview(self.imageBackgroundView!, at: 0)
            self.imageBackgroundView?.bindFrameToSuperviewBounds()
        }
    }
    
    //basic alert... we could stylize and replace this later.
    public func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
}
