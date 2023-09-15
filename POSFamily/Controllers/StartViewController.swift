//
//  ViewController.swift
//  POSFamily
//
//  Created by Malik Muhammad on 9/11/23.
//

import UIKit
import FirebaseAuth
import SystemConfiguration

import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming
import MaterialComponents.MaterialTextControls_FilledTextAreasTheming
import MaterialComponents.MaterialTextControls_FilledTextFieldsTheming
import MaterialComponents.MaterialTextControls_OutlinedTextAreasTheming
import MaterialComponents.MaterialTextControls_OutlinedTextFieldsTheming

class StartViewController: UIViewController {

    @IBOutlet var studentButton: MDCButton!
    @IBOutlet var parentButton: MDCButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentButton.backgroundColor = UIColor.clear
        parentButton.backgroundColor = UIColor.clear
        
        studentButton.setBorderColor(UIColor.white, for: .normal)
        parentButton.setBorderColor(UIColor.white, for: .normal)
        
        studentButton.applyOutlinedTheme(withScheme: globalContainerScheme())
        parentButton.applyOutlinedTheme(withScheme: globalContainerScheme())
        
        studentButton.layer.cornerRadius = 2
        parentButton.layer.cornerRadius = 2
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        if Reachability.isConnectedToNetwork(){
            print("Internet Connection Available!")

                if Auth.auth().currentUser != nil {
                    if Auth.auth().currentUser!.displayName! == "Student" {
                        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "StudentTab") as? UITabBarController  {
                            self.present(vc, animated: true, completion: nil)
                        }
                    } else if Auth.auth().currentUser!.displayName! == "Parent" {
                        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "ParentTab") as? UITabBarController  {
                            self.present(vc, animated: true, completion: nil)
                        }
                    }
                }
            } else {
                self.showToast(message: "Seems to be a problem with your internet. Please check your connection.", font: .systemFont(ofSize: 12))
            }
        
    }

    @IBAction func studentButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func parentButtonPressed(_ sender: Any) {
    }
    
    
    func showToast(message : String, font: UIFont) {
        
        let toastLabel = UILabel(frame: CGRect(x: 0, y: self.view.frame.size.height-180, width: (self.view.frame.width), height: 70))
        toastLabel.backgroundColor = UIColor.lightGray
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.numberOfLines = 4
        toastLabel.layer.cornerRadius = 1;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
}




func globalContainerScheme() -> MDCContainerScheming {
  let containerScheme = MDCContainerScheme()
    
    let colorScheme = MDCSemanticColorScheme(defaults: .material201804)
 
    colorScheme.primaryColor = UIColor.white
    colorScheme.secondaryColor = UIColor.white
    
    containerScheme.colorScheme = colorScheme
    
    
  return containerScheme
}

func secondGlobalContainerScheme() -> MDCContainerScheming {
  let containerScheme = MDCContainerScheme()
    
    let colorScheme = MDCSemanticColorScheme(defaults: .material201804)
 
    colorScheme.primaryColor = UIColor.red
    colorScheme.secondaryColor = UIColor.white
    
    containerScheme.colorScheme = colorScheme
    
    
  return containerScheme
}


public class Reachability {

    class func isConnectedToNetwork() -> Bool {

        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)

        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }

        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }

        /* Only Working for WIFI
        let isReachable = flags == .reachable
        let needsConnection = flags == .connectionRequired

        return isReachable && !needsConnection
        */

        // Working for Cellular and WIFI
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)

        return ret

    }
}
