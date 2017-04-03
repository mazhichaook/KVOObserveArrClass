//
//  ViewController.swift
//  KVOObserveArrClass
//
//  Created by 马志超 on 2017/4/3.
//  Copyright © 2017年 ziqiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.

        model.addObserver(self, forKeyPath: "modelArr", options: [.new , .old ], context: nil)
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height) , style: .plain)
        
        tableView?.delegate = self

        tableView?.dataSource = self

        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "reuseId")
        
        view.addSubview(tableView!)
        
        startTimer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate var timer: Timer?
    
    fileprivate lazy var model: ArrayClass = ArrayClass(dict: ["modelArr" : [Any]()])
    fileprivate  var tableView: UITableView?
    deinit {
    
        model.removeObserver(self, forKeyPath: "modelArr")
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
        
        print("dealloc")
    }
}
// 启动监听及监听方法
extension ViewController{
    fileprivate func startTimer() {
        
        timer = Timer.scheduledTimer(withTimeInterval: Int32(2.0), block: {
            
            self.changeArray()
            
        }, repeats: true)
    }
    fileprivate func changeArray() {
   
        let str = arc4random() % 33
        
        model.mutableArrayValue(forKey: "modelArr").add(str)
    }
}
// MARK: - 监听方法
extension ViewController{
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "modelArr" {
            tableView?.reloadData()
        }
    }
    
}
// MARK: - UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = model.modelArr?.count else {
            return 0
        }
        return count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseId")! as UITableViewCell

        cell.textLabel?.text = "\(model.modelArr?[indexPath.row])"
        
        return cell
    }
}
