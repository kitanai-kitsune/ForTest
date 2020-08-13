//
//  ViewController.swift
//  testJSON
//
//  Created by 金超 on 2020/8/9.
//  Copyright © 2020 jinchao. All rights reserved.
//

import UIKit
import Alamofire//用于获取http请求
import SwiftyJSON//用于读取JSON数据
import AlamofireImage//用于获取网络上的图片

let characterData = "https://raw.githubusercontent.com/kitanai-kitsune/PCRCharacterData/master/CharactorDatas.json"

let chieru = "https://raw.githubusercontent.com/kitanai-kitsune/CharacterPictures/master/chieru3dai.png"

class ViewController: UIViewController {

    let size = CGSize(width: 100, height: 100)
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setupPic(url: String) {
        imageView.af.setImage(withURL: URL(string: url)!)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AF.request(characterData).response { response in//http请求的最基本用法
            if let json = response.value{
                let data = JSON(json)//获取JSON数据 JSON()
                print(data[0,"name"].stringValue)
                print(data[0,"replace","kannjimei"].stringValue)
                print(data[6,"hiragana"].stringValue)
                
            }
        }
        
        setupPic(url: chieru)
        
        AF.request(chieru).responseImage{ response in
            //debugPrint(response)
            print(response.result)
            if let image = response.value{
                print("image downloaded: \(image)")

            
            }
        }
        
    }


}

