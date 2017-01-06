//
//  Spider.swift
//  SocialMediaApp
//
//  Created by Grzegorz Kwaśniewski on 04/01/17.
//  Copyright © 2017 Grzegorz Kwaśniewski. All rights reserved.
//

import Foundation

class Spider {

    private var _spiderId: String = ""
    private var _name: String = ""
    private var _genus: String = ""
    private var _species: String = ""
    private var _commonName: String = ""
    private var _countryOrigin: String = ""
    private var _group: String = ""
    private var _recivedFrom: String = ""
    
    private var _dateRecived: Date = Date()
    private var _imageUrl: String = ""
    
    /* IMPLEMENT AT LATER STAGE
    var last_fed
    var days_houngry
    var feed_every_days
    var feed_days_after_molt
    var sex
    var type
    var venom
    var temperament
    var longevity
    var u_bristels
    var temperature_low
    var temperature_heigh
    var humidity
    var last_rehouse
    var substrate_changed
    var status
    var pre_molt
    var life_stages
    var notes */
    
    var spiderId: String {
        return _spiderId
    }
    
    var name: String {
        return _name
    }
    
    var genus: String {
        return _genus
    }
    
    var species: String {
        return _species
    }
    
    var commonName: String {
        return _commonName
    }
    
    var countryOrigin: String {
        return _countryOrigin
    }
    
    var group: String {
        return _group
    }
    
    var recivedFrom: String {
        return _recivedFrom
    }
    
    var dateRecived: Date {
        return _dateRecived
    }
    
    var imageUrl: String {
        return _imageUrl
    }
    
    init(spiderId: String, spiderData: Dictionary<String, AnyObject>) {
        
        _spiderId = spiderId
        
        if let name = spiderData["name"] as? String {
            _name = name
        }
        
        if let genus = spiderData["genus"] as? String {
            _genus = genus
        }
        
        if let species = spiderData["species"] as? String {
            _species = species
        }
        
        if let commonName = spiderData["commonName"] as? String {
            _commonName = commonName
        }
        
        if let countryOrigin = spiderData["countryOrigin"] as? String {
            _countryOrigin = countryOrigin
        }

        if let group = spiderData["group"] as? String {
            _group = group
        }
        
        if let recivedFrom = spiderData["recivedFrom"] as? String {
            _recivedFrom = recivedFrom
        }
        
        if let dateRecived = spiderData["dateRecived"] as? Date {
            _dateRecived = dateRecived
        }
        
        if let imageUrl = spiderData["imageUrl"] as? String {
            _imageUrl = imageUrl
        }
    }
}
