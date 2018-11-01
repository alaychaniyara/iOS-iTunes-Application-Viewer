//
//  AppDetailViewController.swift
//  iOS-InClass03
//
//  Created by Alay Chaniyara on 11/1/18.
//  Copyright © 2018 Alay Chaniyara. All rights reserved.
//

import UIKit
import SDWebImage

class AppDetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
   
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var developer: UILabel!
    var apps = Apps(title: "", developer: "", imgSml: "", imgLrg: "", date: "", price: "")
    
    @IBOutlet weak var dismiss: UIButton!
    
    @IBAction func clos(_ sender: Any) {
  self.dismiss(animated: true, completion: {})
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "App Details"
        titleLabel.text = apps.title.components(separatedBy: "-")[0]
        dateLabel.text = apps.date.components(separatedBy: "T")[0]
        developer.text = apps.developer
        priceLabel.text = apps.price
        let urlString = apps.imgLrg
        let url = URL.init(string: urlString)
        imageView.sd_setImage(with: url)
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
