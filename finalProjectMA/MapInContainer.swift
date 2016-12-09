//
//  MapInContainer.swift
//  finalProjectMA
//
//  Created by Dionysis Kastellanis on 06/12/2016.
//  Copyright © 2016 MAfinalProjectGroup. All rights reserved.
//

import UIKit
import GoogleMaps
import Alamofire
import SwiftyJSON

class MapInContainer: UIViewController {
    
    var passedSelectedEventFromList: [Event] = []
    
    
    var users : [[String:Any]] =
        [
            ["name": "Ed", "latitude": 51.55, "longitude": -0.173259, "eta":""],
            ["name": "Dio", "latitude": 51.50, "longitude": -0.070, "eta":""],
            ["name": "Manu", "latitude": 51.51, "longitude": -0.071, "eta":""]
    ]
    
    override func viewDidLoad() {
        let meetingTime = self.passedSelectedEventFromList[0].time
        let fullAddress = self.passedSelectedEventFromList[0].address
        let lat = NSString(string: self.passedSelectedEventFromList[0].latitude).doubleValue
        let lng = NSString(string: self.passedSelectedEventFromList[0].longitude).doubleValue


        for i in 0 ..< users.count {

        let urlAPI = "https://maps.googleapis.com/maps/api/directions/json?"
        let urlKey = "key=AIzaSyDEw43MvKypSnZOmxMiTzXs4nJ0ZsTjyJo"
        let latString = String(describing: users[i]["latitude"]!)
        let lonString = String(describing: users[i]["longitude"]!)
        let urlLocation = "origin=" + latString + "," + lonString + "&"
        let url = urlAPI + urlLocation + "mode=transit&destination=51.5014,-0.1419&" + urlKey
        
        Alamofire.request(url).responseJSON
            { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let eta = json["routes"][0]["legs"][0]["duration"]["text"]
                    self.users[i]["eta"] = eta.stringValue
                    
                    let camera = GMSCameraPosition.camera(withLatitude: 51.5, longitude: -0.11, zoom: 9.0)
                    let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
                    mapView.isMyLocationEnabled = true
                    self.view = mapView
                
                for i in 0 ..< self.users.count {
                    let marker = GMSMarker()
                    marker.position = CLLocationCoordinate2D(latitude: self.users[i]["latitude"] as! CLLocationDegrees, longitude: self.users[i]["longitude"] as! CLLocationDegrees)
                    marker.title = self.users[i]["name"] as! String?
                    marker.snippet = self.users[i]["eta"] as! String?
                    marker.map = mapView
                    }

                    
                    let markerEvent = GMSMarker()
                    markerEvent.position = CLLocationCoordinate2D(latitude: lat, longitude: lng)
                    markerEvent.title = fullAddress
                    markerEvent.snippet = meetingTime
                    markerEvent.icon = GMSMarker.markerImage(with: .blue)
                    markerEvent.map = mapView
                    
                case .failure(let error):
                    print(error)
                }
        
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}
