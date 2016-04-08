//
//  ViewController.swift
//  SearchController
//
//  Created by 赵晓东 on 16/4/7.
//  Copyright © 2016年 ZXD. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating {

    //展示列表
    var tableView: UITableView!
    
    //搜索控制器
    var countrySearchController = UISearchController()
    
    //原始数据集
    let schoolArray = ["清华大学","北京大学","中国人民大学","北京交通大学","北京工业大学",
        "北京航空航天大学","北京理工大学","北京科技大学","中国政法大学","中央财经大学","华北电力大学",
        "北京体育大学","上海外国语大学","复旦大学","华东师范大学","上海大学","河北工业大学"]
    
    //搜索过滤后的结果集
    var searchArray:[String] = [String](){
        didSet  {self.tableView.reloadData()}
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.createNav()
        
        self.createView()
    }
    
    func createNav() {
        //设置导航不透明
        self.navigationController?.navigationBar.translucent = true
        
        //设置导航的标题
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:RGBA (255.0, g:255.0, b: 255.0, a: 1),NSFontAttributeName:UIFont.systemFontOfSize(18)]
        self.navigationItem.title = "大学排名"
        
        //设置导航背景图
        self.navigationController?.navigationBar.barTintColor = RGBA (86.0, g:173.0, b: 216.0, a: 1)
    }
    
    
    func createView() {
        tableView = UITableView(frame: CGRectMake(0, 0, WIDTH, HEIGHT))
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        
        //配置搜索控制器
        self.countrySearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
//            controller.hidesNavigationBarDuringPresentation = false
//            controller.dimsBackgroundDuringPresentation = false
//            controller.searchBar.searchBarStyle = .Minimal
//            controller.searchBar.sizeToFit()
            self.tableView.tableHeaderView = controller.searchBar
            
            controller.searchBar.placeholder = "输入学校名称..."
            controller.searchBar.tintColor = UIColor.whiteColor()
            //controller.searchBar.barTintColor = UIColor.orangeColor()
            controller.searchBar.searchBarStyle = .Minimal
            
            controller.hidesNavigationBarDuringPresentation = false;//不会自动隐藏导航了
            
            return controller
        })()
    }
    
    
    //搜索响应
    func updateSearchResultsForSearchController(searchController: UISearchController){
        self.searchArray.removeAll(keepCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@",
            searchController.searchBar.text!)
        let array = (self.schoolArray as NSArray)
            .filteredArrayUsingPredicate(searchPredicate)
        self.searchArray = array as! [String]
    }
    
    
    
    
    
    
    
    //总行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if (self.countrySearchController.active){
            return self.searchArray.count
        } else {
            return self.schoolArray.count
        }
    }
    
    //加载数据
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        //为了提供表格显示性能，已创建完成的单元需重复使用
        let identify:String = "MyCell"
        //同一形式的单元格重复使用，在声明时已注册
        let cell = tableView.dequeueReusableCellWithIdentifier(identify,
            forIndexPath: indexPath)
        
        if (self.countrySearchController.active){
            cell.textLabel?.text = self.searchArray[indexPath.row]
            return cell
        } else {
            cell.textLabel?.text = self.schoolArray[indexPath.row]
            return cell
        }
        
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

