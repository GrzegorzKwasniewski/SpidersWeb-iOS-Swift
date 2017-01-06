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
    
    var currentUserUid = String()
    var spiders = [Spider]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkForSignInUser()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self

        setDelegates()
        getSpidersDataFromFirebase()
        
        searchBar.returnKeyType = UIReturnKeyType.done

    }
    
    func setDelegates() {

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
        
        let spider = spiders[indexPath.row]
        
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
        
        let spider = spiders[indexPath.row]
        performSegue(withIdentifier: "showSpiderDetails", sender: spider)
        
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
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
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
