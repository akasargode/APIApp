//
//  ViewController.swift
//  APIApp
//
//  Created by Ashwin Kasargode on 2/25/19.
//  Copyright © 2019 Ashwin Kasargode. All rights reserved.
//

import UIKit

class RecipiesViewController: UITableViewController {
    var sources = [[String: String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Recipies"
        let query = "http://www.recipepuppy.com/api/?i=onions,garlic&q=omelet&p=3"
    }


}

