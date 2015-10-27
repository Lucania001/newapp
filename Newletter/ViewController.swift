//
//  ViewController.swift
//  Newletter
//
//  Created by Luke Langfield on 14/10/2015.
//  Copyright © 2015 ltlcreation. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON




class ViewController: UIViewController, UITableViewDataSource{
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "hello"
        return cell
    }
    
    
    
    var authorArray = [String]()
    var titles = [String]()
    var Content = [String]()
    
    
    
    
    
    override func viewDidAppear(animated: Bool) {
        
        Alamofire.request(.GET, "http://178.62.83.50/article.json")
            .responseJSON { response in
                // print(response.request)  // original URL request
                // print(response.response) // URL response
                //print(response.data)     // server data
                //print(response.result)   // result of response serialization
                
                /*if let JSON = response.result.value {
                print("JSON: \(JSON)")
                }*/
                
                let json = JSON(data: response.data!)
                //print(json)
                
                
                for (key, subJson) in json["Articles"] {
                    if let author = subJson["title"].string {
                        self.titles.append(author)
                       
                    }
                    if let content = subJson["content"].string {
                        self.Content.append(content)
                        
                    }
                    
                }
               // print("\(self.titles)")
                print("\(self.Content[0])")
                
                
                if let userName = json["NewsLetter"][0]["Author"].string {
                    //Now you got your value
                    //print("\(json)");
                    //self.welcomeMessage = ("\(userName)")
                    //self.authorArray.append(userName);
                    //print(self.authorArray[0])
                    
                    
                }
                if let lastName = json["NewsLetter"][0]["LastName"].string {
                    //Now you got your value
                    //print("\(json)");
                    // print(lastName);
                }
                if let title = json["NewsLetter"][0]["ArticleTitle"].string {
                    //Now you got your value
                    //print("\(json)");
                    // print(title);
                }
                if let contentnews = json["NewsLetter"][1]["Content"].string {
                    //Now you got your value
                    //print("\(json)");
                    //print(content);
                    //self.content.text = "\(contentnews)"
                }
                

        
    }
    
    func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
                
        }
        
        
        
        
        /*let endpoint = NSURL(string: "http://178.62.83.50/test.json")
        let data = NSData(contentsOfURL: endpoint!)
        //print(data);
        
        //var error: NSError?
        do {
            let parsed: AnyObject! = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions(rawValue: 0)) as? NSDictionary
            if let parsed = parsed {
                print(parsed);
                if let employees = parsed["employees"]! as? [[String : AnyObject]]{
                    print(employees)
                    for employee in employees {
                        let firstName = employee["firstName"]! as! String
                        let lastName = employee["lastName"]! as! String
                        
                        print("employee: \(firstName) \(lastName)")
                    }
                }
            } else {
                // more error handling
            }
        } catch let error as NSError {
            print(error);
        }
        */
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

