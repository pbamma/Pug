//
//  ViewController.swift
//  Pug
//
//  Created by Philip Starner on 1/25/18.
//  Copyright © 2018 Philip Starner. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var pugs:[String]?
    var selectedPug:String?
    
    var getPugLock = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIManager.sharedInstance.getPugs(count: 50) { (pugs: [String]?, error: Error?) in
            if let pugs = pugs {
                self.pugs = pugs
                self.collectionView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as! DetailViewController
            vc.title = "Detail"
            vc.pugURLString = self.selectedPug
        }
    }


}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let pugs = self.pugs {
            return pugs.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCollectionViewCell
        
        if let pug = self.pugs?[indexPath.item] {
            cell.loadModel(imageURL: pug)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedPug = self.pugs![indexPath.item]
        self.performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var squareSize = (Constants.ScreenSize.SCREEN_WIDTH / 4)
        var size = CGSize(width: squareSize, height: squareSize)
        if Constants.DeviceType.IS_IPAD {
            squareSize = (Constants.ScreenSize.SCREEN_WIDTH / 8)
            size = CGSize(width: squareSize, height: squareSize)
        }
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return CGSize(width: Constants.ScreenSize.SCREEN_WIDTH, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footer", for: indexPath as IndexPath)
        return view
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height
        
        if (bottomEdge >= scrollView.contentSize.height)
        {
            if !getPugLock {
                getPugLock = true
                APIManager.sharedInstance.getPugs(count: 50) { (pugs: [String]?, error: Error?) in
                    if let pugs = pugs {
                        self.pugs?.append(contentsOf: pugs)
                        self.collectionView.reloadData()
                    }
                    self.getPugLock = false
                }
            }
        }
    }
    
}
