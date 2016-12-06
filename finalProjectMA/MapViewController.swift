//
//  MapViewController.swift
//  finalProjectMA
//
//  Created by Manuela Sabatino on 06/12/2016.
//  Copyright © 2016 MAfinalProjectGroup. All rights reserved.
//

    import UIKit
    import GoogleMaps
    
    class MapViewController: UIViewController {
        
    
        let users : [[String:Any]] =
            [
                ["name": "Ed", "latitude": 51.55, "longitude": -0.073259],
                ["name": "Dio", "latitude": 51.50, "longitude": -0.070],
                ["name": "Manu", "latitude": 51.51, "longitude": -0.071]
        ]
        
        
        override func viewDidLoad() {
            // Create a GMSCameraPosition that tells the map to display the
            // coordinate -33.86,151.20 at zoom level 6.
            let camera = GMSCameraPosition.camera(withLatitude: 52.86, longitude: 0.0, zoom: 6.0)
            let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
            mapView.isMyLocationEnabled = true
            view = mapView
            
            for i in 0 ..< users.count {
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: users[i]["latitude"] as! CLLocationDegrees, longitude: users[i]["longitude"] as! CLLocationDegrees)
                marker.title = users[i]["name"] as! String?
                marker.snippet = "User"
                marker.map = mapView
            }
            
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: 51.5014, longitude: -0.1419)
            marker.title = "Buckingham Palace"
            marker.snippet = "tour"
            marker.icon = GMSMarker.markerImage(with: .blue)
            marker.map = mapView
            
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        }
        
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

