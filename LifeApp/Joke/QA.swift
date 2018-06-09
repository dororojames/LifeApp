//
//  QA.swift
//  LifeApp
//
//  Created by Student on 2018/6/5.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit




class QA: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBAction func back(_ sender: Any) {
    }


    
    var list = [Joke]()
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! JokeTableViewCell
        cell.accessoryType = .disclosureIndicator
        //cell.textLabel?.text = self.list[indexPath.row]
        cell.JokeName?.text=list[indexPath.row].Name
        cell.StarNum?.text=String(list[indexPath.row].Score!)
        return cell
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        list.append(Joke(Name: "笑話1",jokeType: "黃色笑話",Score: 3,Content: "嗨嗨1"))
        list.append(Joke(Name: "笑話2",jokeType: "問答笑話",Score: 1,Content: "嗨嗨2"))
        list.append(Joke(Name: "笑話3",jokeType: "內涵笑話",Score: 2,Content: "嗨嗨3"))
        
        // Do any additional setup after loading the view.
    }
    
    
    // UITableViewDelegate 方法，处理列表项的选中事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView!.deselectRow(at: indexPath, animated: true)
        let JokeTitleString = [self.list[indexPath.row].Name,self.list[indexPath.row].Content]
        self.performSegue(withIdentifier: "ShowJokeText", sender: JokeTitleString)
    }
    
    //在这个方法中给新页面传递参数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowJokeText"{
            let controller = segue.destination as! JokeTest
            controller.JokeTitleString = sender as! [String]
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
