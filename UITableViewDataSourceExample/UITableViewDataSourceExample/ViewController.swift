//
//  ViewController.swift
//  UITableViewDataSourceExample
//
//  Created by 원현식 on 2020/10/28.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segement: UISegmentedControl!
    var dataSoruce = [UITableViewDataSource]()
    let catDataSource = CatDataSource()
    let smilelyDataSource = SmilelyDataSource()
    
    let modelController = ModelController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        catDataSource.dataList = modelController.kittisList
        smilelyDataSource.dataList = modelController.smileyList
        dataSoruce = [catDataSource, smilelyDataSource]

        tableView.dataSource = dataSoruce[0]
        tableView.tableFooterView = UIView(frame: CGRect.zero)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func segementChanged(_ sender: Any) {
        tableView.dataSource = dataSoruce[segement.selectedSegmentIndex]
        tableView.reloadData()
    }
    


}

