//
//  ViewController.swift
//  Memo
//
//  Created by Ahn on 2020/05/23.
//  Copyright © 2020 ozofweird. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var personList: [Content] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
// 3.
        //위임
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // Cell 연결
        let cellNib = UINib(nibName: "TableCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "TableCell")

    }
    
// 8.
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }


}

// 2.
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.personList.count
    }
    
// 4.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as? TableCell else {
            return UITableViewCell()
        }
        
        cell.nameLabel.text = self.personList[indexPath.row].name
        
        return cell
    }
    
// 5.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
               
        let dvc = DetailController(nibName: "DetailController", bundle: nil)
        dvc.modalPresentationStyle = .fullScreen
               
        dvc.tempText = self.personList[indexPath.row].name
        dvc.tempRow = indexPath.row
        
        // prepare 함수 역할을 대신 수행 (위임)
        dvc.detailProtocol = self
        self.present(dvc, animated: true, completion: nil)
    }
    
// 6.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.personList.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
}

// 7.
extension ViewController: ContentProtocol {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue" {
            guard let avc: AddController = segue.destination as? AddController else {
                return
            }
            avc.addProtocol = self
        }
    }
    
        func addSend(data: String) {
            self.personList.append(Content(name: data))
//            self.tableView.reloadData()
            
        }
        
        func detailSend(data: String, row: Int) {
            self.personList[row].name = data
//            self.tableView.reloadData()
        }
        
    
}
