//
//  ViewController.swift
//  CustomCVTransition
//
//  Created by 金超 on 2020/9/2.
//  Copyright © 2020 jinchao. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(tap:))))
    }

    @IBAction func showDetail(_ sender: Any) {
        
        let detailVC = storyboard!.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        detailVC.modalPresentationStyle = .fullScreen
        present(detailVC, animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    @objc private func handleTap(tap: UITapGestureRecognizer){
        
        let detailVC = storyboard!.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        detailVC.modalPresentationStyle = .fullScreen
        present(detailVC, animated: true, completion: nil)
        
    }
    
    
    
}

