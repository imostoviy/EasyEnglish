//
//  ViewController.swift
//  EasyEnglish
//
//  Created by Мостовий Ігор on 3/5/19.
//  Copyright © 2019 Мостовий Ігор. All rights reserved.
//

import UIKit
import Floaty

class DictionaryViewController: UIViewController {

    @IBOutlet weak var floatyButton: Floaty!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)

        floatyButton.sticky = true
        floatyButton.addItem("Add word", icon: nil) { (_) in
            let storyboard = UIStoryboard(name: "AddNewWord", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "AddWordNavController")
            self.present(vc, animated: true, completion: nil)
        }
        floatyButton.addItem(title: "List of added words")
        tableView.addSubview(floatyButton)
    }

}
