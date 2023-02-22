//
//  AlertManager.swift
//  QantasAirport
//
//  Created by rakesh.e.mishra on 21/02/23.
//

import Foundation
import UIKit

class AlertManager {
    static let shared = AlertManager()
           
    func showSimpleAlert(title: String, msg: String, viewController: UIViewController, action: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)

        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
            alertController.dismiss(animated: true)
        }))
        
        alertController.addAction(UIAlertAction(title: "Retry Offline",
                                      style: UIAlertAction.Style.default,
                                      handler: action))
    
        viewController.present(alertController, animated: true)
    }
    
}
