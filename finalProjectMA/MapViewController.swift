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
        
        @IBOutlet weak var user: UITextField!
        
        @IBOutlet weak var user2: UITextField!
        
        @IBOutlet weak var user3: UITextField!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            user.text = "Ed"
            user2.text = "Dio"
            user3.text = "Manu"
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

