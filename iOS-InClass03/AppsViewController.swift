//
//  AppsViewController.swift
//  iOS-InClass03
//
//  Created by Alay Chaniyara on 10/31/18.
//  Copyright © 2018 Alay Chaniyara. All rights reserved.
//

import UIKit
import SDWebImage

class AppsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return tableArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Apps", for: indexPath)
       let title = cell.viewWithTag(2) as! UILabel
        let developer = cell.viewWithTag(3) as! UILabel
        let date = cell.viewWithTag(4) as! UILabel
        let price = cell.viewWithTag(5) as! UILabel
        let urlString = tableArr[indexPath.row].imgSmall
        let url = URL.init(string: urlString)
       let imageview = cell.viewWithTag(1) as! UIImageView
        imageview.sd_setImage(with: url)
        title.text = tableArr[indexPath.row].title.components(separatedBy: "-")[0]
        developer.text = tableArr[indexPath.row].developer
        date.text = tableArr[indexPath.row].releaseDate.components(separatedBy: "T")[0]
        price.text = tableArr[indexPath.row].price
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        apps = Apps (title: tableArr[indexPath.row].title, developer: tableArr[indexPath.row].developer, imgSml: tableArr[indexPath.row].imgSmall, imgLrg: tableArr[indexPath.row].imgLarge, date: tableArr[indexPath.row].releaseDate, price: tableArr[indexPath.row].price)
        
        performSegue(withIdentifier: "appDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AppDetailViewController
        vc.apps
            = apps
        
    }
    @IBOutlet weak var tableView: UITableView!
    
    
    var selected = ""
    var apps = Apps(title: "", developer: "", imgSml: "", imgLrg: "", date: "", price: "")
    var tableArr:[(title: String, developer: String, imgSmall: String, imgLarge: String, releaseDate: String, price: String)]!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Apps"
       // print(AppsData.data[selected].)
        tableArr = Array(AppsData.data[selected]!)
       print(tableArr.count) 
        //print(AppsData.data[selected]!)
      print("\(selected)")
        
        
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
