//
//  ViewController.swift
//  APIApp
//
//  Created by Ashwin Kasargode on 2/25/19.
//  Copyright © 2019 Ashwin Kasargode. All rights reserved.
//

import UIKit

class RecipiesViewController: UITableViewController {
    var results = [[String: String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Recipies"
        let query = "http://www.recipepuppy.com/api/?i=onions,garlic&q=omelet&p=3"
        DispatchQueue.global(qos: .userInitiated).async {
            [unowned self] in
            if let url = URL(string: query) {
                if let data = try? Data(contentsOf: url) {
                    let json = try! JSON(data: data)
                    if json["status"] == "ok" {
                        self.parse(json: json)
                        return
                    }
                }
            }
            self.loadError()
        }
    }
    func parse(json: JSON){
        for result in json["results"].arrayValue {
            let title = result["title"].stringValue
            let href = result["href"].stringValue
            let ingredients = result["ingredients"].stringValue
            let result = ["title": title, "href": href, "ingredients": ingredients]
            results.append(result)
        }
        DispatchQueue.main.async {
            [unowned self] in
            self.tableView.reloadData()
        }
    }
    func loadError() {
        let alert = UIAlertController(title: "Loading Error",
                                      message: "There was a problem loading the recipies feed",
                                      preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil) }


}
