//
//  HomeTableViewController.swift
//  Twitter
//
//  Created by Juan Jose Gomez Medina on 2/15/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    var tweetArray = [NSDictionary]()
    var numberOfTweets: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTweet()
    }
    
    
    @IBAction func onLogout(_ sender: Any) {
        TwitterAPICaller.client?.logout()
        self.dismiss(animated: true, completion: nil) //nil is nothing
        UserDefaults.standard.set(false, forKey: "UserLoggedIn") // set the bool to false so it remebers that the user logged out.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetTableViewCell
        
        let user = tweetArray[indexPath.row]["user"] as! NSDictionary
        //cell.UserNameLabel.text = user["name"] as? String
        cell.TweetContent.text = (tweetArray[indexPath.row]["text"] as! String)
        cell.UserNameLabel.text = "Juan Jose Gomez"
        
        let imgUrl = URL(string: (user["profile_image_url_https"] as? String)!)
        let data = try? Data(contentsOf: imgUrl!)
        
        if let imgData = data{
            cell.ProfileImageView.image = UIImage(data: imgData)
        }
        
        return cell
    }
    
    func loadTweet(){
        
        let myUrl = "https://api.twitter.com/1.1/statuses/home_timeline.json"
        let myParams = ["count": 10]
        
        TwitterAPICaller.client?.getDictionariesRequest(url: myUrl, parameters: myParams, success:                                                            { (tweets:[NSDictionary]) in
            
            self.tweetArray.removeAll() // meakes the array is empty at start
            for tweet in tweets{
                self.tweetArray.append(tweet)
            }
            
            self.tableView.reloadData()
            
        }, failure: {(Error) in print("could not retrieve tweets.")
            
        })
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tweetArray.count
    }    
}
