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

final class SpiderCollectionVC: BaseVC {
    
    // MARK: Properties
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var dataService: DataService
    
    var currentUserUid = String()
    var spiders = [Spider]()
    var filteredSpiders = [Spider]()
    
    var inSearchMode = false
    
    // MARK: Initializers
    
    /**
     
     Custom initializer with dependency injection
     
     */
    
    init(withDataService dataService: DataService) {
        self.dataService = dataService
        super.init(nibName: nil, bundle: nil)
    }
    
    /**
     
     Default initializer for testing
     
     */
    
    init() {
        self.dataService = FirebaseDataService.ds
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.dataService = FirebaseDataService.ds
        super.init(coder: aDecoder)
    }
    
    // MARK: View State

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkForSignInUser()
        setDelegates()
        getSpidersDataFromFirebase()
        
        searchBar.returnKeyType = UIReturnKeyType.done

    }
    
    // MARK: Actions
    
    @IBAction func logoutUser(_ sender: UIButton) {
        _ = KeychainWrapper.removeObjectForKey(KEY_UID)
        try! FIRAuth.auth()?.signOut()
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: Custom Functions
    
    func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
    }
}

// MARK: Delegate For Collection View

extension SpiderCollectionVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var spider = Spider(spiderId: nil, spiderData: [:])
        
        if inSearchMode {
            spider = filteredSpiders[indexPath.row]
        } else {
            spider = spiders[indexPath.row]
        }
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "spiderCell", for: indexPath) as? CellSpider {
            
            if let image = SignInVC.imageCache.object(forKey: spider.imageUrl as NSString) {
                cell.configureCell(spider: spider, image: image)
                return cell
            } else {
                
                dataService.downloadSpiderImage(fromURL: spider.imageUrl, completion: { (image) in
                        cell.configureCell(spider: spider, image: image)
                })
                
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
}

// MARK: Firebase Delegate

extension SpiderCollectionVC {
    
    /**
     
    Check if current user is signed in. Use bulid in Firebase method to check that
     
    */
    
    func checkForSignInUser() {
        if let currentFirebaseUser = FIRAuth.auth()?.currentUser {
            currentUserUid = currentFirebaseUser.uid
        }
    }
    
    /**
 
    Download all data about spiders for current user from Firebase server
 
    */
    
    func getSpidersDataFromFirebase() {
        
        dataService.downloadSpidersData(forUser: currentUserUid) { (spiders) in
            DispatchQueue.main.async {
                self.spiders = spiders
                self.collectionView.reloadData()
            }
        }
    }
}

// MARK: UISearchBar Delegate

extension SpiderCollectionVC: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text.isNilOrEmpty() {
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

// MARK: Segue Delegate

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
