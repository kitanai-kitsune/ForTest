//
//  DetailViewController.swift
//  CustomCVTransition
//
//  Created by 金超 on 2020/9/2.
//  Copyright © 2020 jinchao. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        detailImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap2(tap:))))
        
        }
    
    @objc func handleTap2(tap: UITapGestureRecognizer){
    dismiss(animated: true, completion: nil)
        
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
