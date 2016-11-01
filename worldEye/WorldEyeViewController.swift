//
//  WorldEyeViewController.swift
//  worldEye
//
//  Created by Fran Navarro on 29/10/16.
//  Copyright © 2016 frndev. All rights reserved.
//

import UIKit
import MapKit

class WorldEyeViewController : UIViewController {
    
    var coordinator : WorldEyeCoordinator!

    @IBOutlet weak var eyeMap: MKMapView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coordinator = WorldEyeCoordinator(controller: self)
        
        searchBar.delegate = coordinator
        
        eyeMap.delegate = coordinator
        
        let request = API.makeRequest(url: URL(string:"https://stream.twitter.com/1.1/statuses/sample.json")!)
        
        let urlSession = URLSession(configuration: .default)
        
        let task = urlSession.dataTask(with: request) { (data, response, error) in
            print(data)
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

