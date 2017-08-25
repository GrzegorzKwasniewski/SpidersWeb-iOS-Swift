//
//  SpiderCollectionVC.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 04/01/17.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class SpiderCollectionVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var currentUserUid = String()
    var spiders = [Spider]()
    var filteredSpiders = [Spider]()
    
    var inSearchMode = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkForSignInUser()
        setDelegates()
        getSpidersDataFromFirebase()
        
        searchBar.returnKeyType = UIReturnKeyType.done

    }
    
    @IBAction func logoutUser(_ sender: UIButton) {
        let keychainResult = KeychainWrapper.removeObjectForKey(KEY_UID)
        try! FIRAuth.auth()?.signOut()
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
    }
}

extension SpiderCollectionVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var spider = Spider()
        
        if inSearchMode {
            spider = filteredSpiders[indexPath.row]
        } else {
            spider = spiders[indexPath.row]
        }
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "spiderCell", for: indexPath) as? CellSpider {
            
            if let image = FeedVC.imageCache.object(forKey: spider.imageUrl as NSString) {
                cell.configureCell(spider: spider, image: image)
                return cell
            } else {
                cell.configureCell(spider: spider)
                return cell
            }
        } else {
            return CellSpider()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.resizeButtonAnimation()
        let spider = spiders[indexPath.row]
        performSegue(withIdentifier: "showSpiderDetails", sender: spider)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode {
           return filteredSpiders.count
        } else {
           return spiders.count
        }
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
    
    func checkForSignInUser() {
        if let currentFirebaseUser = FIRAuth.auth()?.currentUser {
            currentUserUid = currentFirebaseUser.uid
        }
    }
    
    func getSpidersDataFromFirebase() {
        DataService.ds.REF_SPIDERS.observe(.value, with: {(snapshot) in
            self.spiders = []
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshots {
                    print("SNAP: \(snap)")
                    if let snapDictionary = snap.value as? Dictionary<String, AnyObject> {
                        let userUid = snapDictionary["userUid"]
                        if userUid!.isEqual(self.currentUserUid) {
                            let key = snap.key
                            let spider = Spider(spiderId: key, spiderData: snapDictionary)
                            self.spiders.append(spider)
                        }
                    }
                }
            }
            self.collectionView.reloadData()
        })
    }
}

// MARK: Handle UISearchBar
extension SpiderCollectionVC: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            collectionView.reloadData()
        } else {
            inSearchMode = true
            
            let lower = searchBar.text!.lowercased()
            
            filteredSpiders = spiders.filter({$0.name.range(of: lower) != nil })
            
            collectionView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        inSearchMode = true
        collectionView.reloadData()
        searchBar.showsCancelButton = false
        //searchBar.text = nil
        view.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        inSearchMode = false
        collectionView.reloadData()
        searchBar.showsCancelButton = false
        searchBar.text = nil
        view.endEditing(true)
    }
}

// MARK: Handle segue
extension SpiderCollectionVC {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSpiderDetails" {
            if let detailsVC = segue.destination as? SpiderDetailVC {
                if let spider = sender as? Spider {
                    detailsVC.spider = spider
                }
            }
        }
    }
}
