//
//  AirportDetailsVC.swift
//  QantasAirports
//
//  Created by rakesh.e.mishra on 22/02/23.
//

import UIKit

class AirportDetailsVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    var airportName = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        print("airportName: \(airportName)")
        nameLabel.text = airportName
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
