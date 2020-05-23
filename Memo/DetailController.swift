//
//  DetailController.swift
//  Memo
//
//  Created by Ahn on 2020/05/23.
//  Copyright © 2020 ozofweird. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    @IBOutlet weak var detailTextView: UITextView!
    
    var detailProtocol: ContentProtocol?
    var tempText: String?
    var tempRow: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func detailDoneBtn(_ sender: Any) {
        if let text = detailTextView.text {
            detailProtocol?.detailSend(data: text, row: tempRow!)
            dismiss(animated: true, completion: nil)
        }
    }
    
}
