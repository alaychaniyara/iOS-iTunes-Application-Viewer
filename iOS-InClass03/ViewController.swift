//
//  ViewController.swift
//  iOS-InClass03
//
//  Created by Alay Chaniyara on 10/31/18.
//  Copyright © 2018 Alay Chaniyara. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var name = [String] ()
    var selectedcategory = ""
    @IBOutlet weak var CategoriesList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        name = Array(AppsData.categories)
        name.sort()
        CategoriesList.delegate = self
        CategoriesList.dataSource = self
        print(AppsData.data.keys.count)
        // print("\(AppsData.categories[in])")
        self.title = "Categories"
        self.CategoriesList.tableFooterView = UIView(frame: CGRect.zero)
     
     }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //let item = cell.viewWithTag(23) as! UILabel
        
        cell.textLabel?.text = name[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedcategory = name[indexPath.row]
        
        performSegue(withIdentifier: "selectedCategory", sender: self)
        
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      //  print("\(selectedcategory)Hello")// Do any additional setup after loading the view, typically from a nib.
        
            let vc = segue.destination as! AppsViewController
            vc.selected = selectedcategory
            
           }

}

