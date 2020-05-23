//
//  AddController.swift
//  Memo
//
//  Created by Ahn on 2020/05/23.
//  Copyright © 2020 ozofweird. All rights reserved.
//

import UIKit

class AddController: UIViewController {

    @IBOutlet weak var addTextView: UITextView!
    
    var addProtocol: ContentProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addDoneBtn(_ sender: Any) {
        if let text = addTextView.text {
            addProtocol?.addSend(data: text)
            dismiss(animated: true, completion: nil)
        }
    }
}
