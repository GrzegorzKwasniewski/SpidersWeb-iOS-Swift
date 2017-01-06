//
//  SpiderCollectionVC.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 04/01/17.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import Firebase

class SpiderCollectionVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var spiders = [Spider]()

    override func viewDidLoad() {
        super.viewDidLoad()

        getSpidersDataFromFirebase()
        setDelegates()
        
        searchBar.returnKeyType = UIReturnKeyType.done

    }
    
    func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
    }

    @IBAction func goToUserSettings(_ sender: AnyObject) {
        if let slideMenuController = self.slideMenuController() {
            slideMenuController.openLeft()
        } else {
            print("README: There's no slideMenuController - check if You have container ViewController for slide menu")
        }
    }
}

extension SpiderCollectionVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "spiderCell", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return spiders.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /* func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    } */

}

// MARK: Handle Firebase
extension SpiderCollectionVC {
    
    func getSpidersDataFromFirebase() {
        DataService.ds.REF_POSTS.observe(.value, with: {(snapshot) in
            self.spiders = []
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshots {
                    print("SNAP: \(snap)")
                    if let snapDictionary = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let spider = Spider(spiderId: key, spiderData: snapDictionary)
                        self.spiders.append(spider)
                    }
                }
            }
            self.collectionView.reloadData()
        })
    }
}

extension SpiderCollectionVC: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}
