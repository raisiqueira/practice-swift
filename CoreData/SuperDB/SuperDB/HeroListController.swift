//
//  HeroListController.swift
//  SuperDB
//
//  Created by Domenico on 31/05/15.
//  Copyright (c) 2015 Domenico. All rights reserved.
//

import UIKit

class HeroListController: UIViewController, UITableViewDataSource,
            UITableViewDelegate, UITabBarDelegate {

    @IBOutlet weak var heroTableView: UITableView!
    @IBOutlet weak var heroTabBar: UITabBar!
    let kSelectedTabDefaultsKey = "SelectedTab"
    
    enum tabBarKeys: Int{
        case ByName
        case BySecretIdentity
    }
    
    override func viewDidLoad() {
        // Adding the editing button
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // Select the TabBar item
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let selectedTab = userDefaults.integerForKey(kSelectedTabDefaultsKey)
        let item = heroTabBar.items?[selectedTab] as! UITabBarItem
        heroTabBar.selectedItem = item
    }
    //- MARK: UITabBarDelegate
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem!) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let items: NSArray = heroTabBar.items!
        let tabIndex = items.indexOfObject(item)
        defaults.setInteger(tabIndex, forKey: kSelectedTabDefaultsKey)
    }
    
    //- MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HeroListCell", forIndexPath: indexPath) as! UITableViewCell
        return cell
    }
}