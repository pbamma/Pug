//
//  DetailViewController.swift
//  Pug
//
//  Created by Philip Starner on 1/25/18.
//  Copyright © 2018 Philip Starner. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: BaseViewController {
    
    @IBOutlet weak var pugImage: UIImageView!
    var pugURLString:String!

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: pugURLString)
        self.pugImage.sd_setImage(with: url)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
