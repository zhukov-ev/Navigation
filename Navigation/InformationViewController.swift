//
//  InformationViewController.swift
//  Navigation
//
//  Created by Евгений Жуков on 24/04/2019.
//  Copyright © 2019 Евгений Жуков. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    
    var textOfLabel = ""
    
    @IBOutlet var information: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        information.text = textOfLabel
    }
}
