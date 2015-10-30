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
    
    @IBOutlet weak var tableview: UITableView!
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //get data from network call
        loaddata()
     
        //end view did load
    }
    
    func loaddata(){
        
        Alamofire.request(.GET, "http://178.62.83.50/article.json")
            .responseJSON { response in
                // print(response.request)  // original URL request
                // print(response.response) // URL response
                //print(response.data)     // server data
                //print(response.result)   // result of response serialization
                
                /*if let JSON = response.result.value {
                print("JSON: \(JSON)")
                }*/
                
                //get json from response data
                let json = JSON(data: response.data!)
                //print(json)
                
                //for loop over json and write all article titles articles array
                
                
             
                
                
                
                for (key, subJson) in json["Articles"] {
                    
                    
                    
                    let author = subJson["title"].string
                    let subheading = subJson["subheading"].string
                    let content = subJson["content"].string
                    let Author = subJson["author"].string
                    
                    let stuff = Article(name: author!, subheading: subheading!, content: content!, author: Author!)
                    
                    
                        self.articles.append(stuff!)
                        
                        //end iff
                    
                    //if let content = subJson["content"].string {
                    // self.Content.append(content)
                    
                    //}
                    
                    //end for
                }
                // print("\(self.titles)")
                //print("\(self.Content[0])")
                //print(self.articles)
                
                //set variable to articles number 6 to check append worked
                let name = self.articles[4].author
                
                //print varibale name to check
                print("\(name)")
                
                dispatch_async(dispatch_get_main_queue(), {
                    [unowned self] in
                    self.tableview.reloadData()
                    })
                
        }
        
        }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //let num = articles.count
       // print(num)
        //return number of rows
        return articles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        //let (artTitle) = articles[indexPath.row]
        
        // Fetches the appropriate article for the data source layout.
        let article = articles[indexPath.row]
        
        //set cell text label to article name
        cell.textLabel?.text = article.name
        return cell
    }
    
    
    
   /* var authorArray = [String]()
    var titles = [String]()
    var Content = [String]()*/
    
    
   
    
    
    
    //func viewDidAppear(animated: Bool) {
        
       /* Alamofire.request(.GET, "http://178.62.83.50/article.json")
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
                        self.artTitles.append(author)
                       
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
                

        
    }*/
    
    
        
        
        
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


  
    //end of class
    }



