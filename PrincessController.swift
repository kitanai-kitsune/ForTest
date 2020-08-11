//
//  PrincessController.swift
//  princonnectGuide
//
//  Created by 金超 on 2020/8/8.
//  Copyright © 2020 jinchao. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PrincessController: UITableViewController {
    
    var PrincessDatas = [PrincessData]()//在model中定义了PrincessData有哪些属性 创建了一个叫PrincessDatas的空数组 类型为PrincessData
    
    func getJSONData(){
    AF.request("https://raw.githubusercontent.com/kitanai-kitsune/PCRCharacterData/master/CharactorDatas.json").responseJSON { response in//http请求的最基本用法
        if let json = response.value{//如果成功取到值则付给json
            let data = JSON(json)//获取系统可读取可使用的JSON数据格式(等于是转码) JSON()

            for num in 0...data.count - 1{

            let a = data[num,"name"].stringValue
            print(a)//找图片用

            let b = data[num,"katakana"].stringValue
            print(b)//显示名字片假名用
                
            let c = data[num,"replace","defaultstar"].intValue
            print(c)//显示角色初始星数
            
            let d = PrincessData(characterIcon: "\(a)" + String(c), characterName: "\(b)", characterStar: c)

            self.PrincessDatas.append(d)//往数组里面加数据
            self.tableView.reloadData()//获得数据之后刷新一次页面
                
            }

            print("网络上共有\(data.count)条数据")
            print("本地共有\(self.PrincessDatas.count)条数据")
            
            
        }
    }
    }
    
    //只运行一次
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getJSONData()
        
    }
    
    //几段 默认1
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    //几行=几个cell
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PrincessDatas.count//提供多少数据就给多少行
    }

    //配置每行里面显示什么
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PCR", for: indexPath) as! PrincessCell//重用哪个单元格 "PCR"

        //cell.textLabel?.text = "コッコロ"//如果cell里面有一个textLabel的话 给他付值 因为有可能没有所以加?
        //indexPath.row 行数 第N行
        //indexPath.section 段数 第N段
        
        //在这里判断角色星数如果是1显示什么图片 3显示什么图片 6显示什么图片
            cell.characterIcon.image = UIImage.init(named: PrincessDatas[indexPath.row].characterIcon)
            print(PrincessDatas[indexPath.row].characterIcon)
            cell.characterName.text = PrincessDatas[indexPath.row].characterName
        
//        cell.characterIcon.image = UIImage.init(named: PrincessDatas[indexPath.row].characterIcon)
//        cell.characterName.text = PrincessDatas[indexPath.row].characterName

        return cell
    }
    
    //当用户选择了cell之后发生了什么 cell指行 一行就是一个cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //PrincessDatas[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)//取消选择之后的灰色底色
    }
    
    //按下按钮时,去到下一个页面前做的事(等于正向传值 给下一个界面) 走的是detailInfoButton这条路线 detailInfoButton的destination是DetailInformationController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailInfoButton"{//先确定走的路线是detailInfoButton
            let vc = segue.destination as! DetailInformationController//然后确定路线的目的地是DetailInfomationController 并把它付值给vc
            let cell = sender as! PrincessCell//因为要从用户点的cell确定indexPath 所以这里先定义cell是哪个cell-PrincessCell
            let row = tableView.indexPath(for: cell)!.row//通过cell找到indexPath的行数  固定用法tableview.indexPath(for: )
            vc.DaiPicName = PrincessDatas[row].characterIcon + "dai"//把值(角色大图名)付给vc里面(DetailInformationController)的DaiPicName值
            vc.Star = PrincessDatas[row].characterStar//把值(星数)付给vc里面(DetailInformationController)的Star值
        }
    }

}
