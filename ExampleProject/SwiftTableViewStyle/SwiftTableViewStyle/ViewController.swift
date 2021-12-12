//
//  ViewController.swift
//  SwiftTableViewStyle
//
//  Created by Heo on 2021/12/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var sectionHeader = ["Section Header 1", "Section Header 2"]
    var sectionFooter = ["Section Footer 1", "Section Footer 2"]
    var cellDataSource = ["Cell 1", "Cell 2", "Cell 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    /// 섹션 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeader.count
    }
    
    /// 섹션의 Header 타이틀 설정
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeader[section]
    }
    
    /// 섹션의 Footer 타이틀 설정
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return sectionFooter[section]
    }
    
    /// 섹션의 Cell 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellDataSource.count
    }
    
    /// Cell 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = cellDataSource[indexPath.row]
        return cell
    }
}
