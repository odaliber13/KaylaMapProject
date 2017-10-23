//
//  ViewController.swift
//  Kayla Map Project
//
//  Created by Liv d'Aliberti on 10/14/17.
//  Copyright © 2017 LivLoveApp. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, UISearchBarDelegate {
   
    @IBOutlet var searchBarMap: UISearchBar!
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func updateLocation(_ sender: Any) {
    }
    @IBOutlet weak var locationInfo: UILabel!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        searchBarMap.delegate = self
        // Do any additional setup after loading the view, typically from a nib
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBarMap.resignFirstResponder()
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(searchBarMap.text!){ (placemarks:[CLPlacemark]?, error:Error?) in
            if error == nil{
                
                let placemark = placemarks?.first
                
                let anno = MKPointAnnotation()
                
                anno.coordinate = (placemark?.location?.coordinate)!
                anno.title = self.searchBarMap.text!
                
                let span = MKCoordinateSpanMake(0.075, 0.075)
                let region = MKCoordinateRegion(center: anno.coordinate, span:span)
                
                self.mapView.setRegion(region, animated:true)
                
                self.mapView.addAnnotation(anno)
                self.mapView.selectAnnotation(anno, animated: true)
                
                
            }else{
                print(error?.localizedDescription ?? "error")
            }

}

}

}
