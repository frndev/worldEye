//
//  WorldEyeCoordinator.swift
//  worldEye
//
//  Created by Fran Navarro on 29/10/16.
//  Copyright © 2016 frndev. All rights reserved.
//

import Foundation
import MapKit

public class WorldEyeCoordinator : NSObject {
    
    weak var controller : WorldEyeViewController?
    
    init(controller : WorldEyeViewController){
        self.controller = controller
        super.init()
    }
    
    
}


extension WorldEyeCoordinator : MKMapViewDelegate{
    
    public func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        
        mapView.region = MKCoordinateRegion(center: mapView.centerCoordinate, span: MKCoordinateSpan(latitudeDelta: 135, longitudeDelta: 131))
    }
    

    
    
}


extension WorldEyeCoordinator : UISearchResultsUpdating {
    
    
    public func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
}


extension WorldEyeCoordinator : UISearchBarDelegate {
    
    
    
}
