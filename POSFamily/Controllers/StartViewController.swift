//
//  ViewController.swift
//  POSFamily
//
//  Created by Malik Muhammad on 9/11/23.
//

import UIKit

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

    @IBAction func studentButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func parentButtonPressed(_ sender: Any) {
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
