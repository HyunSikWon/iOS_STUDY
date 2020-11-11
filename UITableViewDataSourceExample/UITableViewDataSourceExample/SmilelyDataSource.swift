//
//  SmilelyDataSource.swift
//  UITableViewDataSourceExample
//
//  Created by 원현식 on 2020/10/28.
//

import Foundation
import UIKit

class SmilelyDataSource: NSObject, UITableViewDataSource {
    var dataList: [String] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "smilelyCell", for: indexPath)
        cell.textLabel?.text = dataList[indexPath.row]
        return cell
    }
    
}
