//
//  ConversationListViewController.swift
//  IMTest
//
//  Created by HouMeng on 16/5/20.
//  Copyright © 2016年 侯猛. All rights reserved.
//



import UIKit

class ConversationListViewController: RCConversationListViewController {
    
    func RGB (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor { return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a) }
    
    let conVC = RCConversationViewController()
    var window : UIWindow?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.conversationListTableView.tableFooterView = UIView()
        self.windowNormal()
        
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        
        appDelegate?.connectServer({ () -> Void in

            self.setDisplayConversationTypes([
                RCConversationType.ConversationType_PRIVATE.rawValue,
                RCConversationType.ConversationType_GROUP.rawValue,
                RCConversationType.ConversationType_SYSTEM.rawValue,
                RCConversationType.ConversationType_CHATROOM.rawValue,
                RCConversationType.ConversationType_APPSERVICE.rawValue,
                RCConversationType.ConversationType_DISCUSSION.rawValue,
                RCConversationType.ConversationType_PUSHSERVICE.rawValue,
                RCConversationType.ConversationType_PUBLICSERVICE.rawValue,
                RCConversationType.ConversationType_CUSTOMERSERVICE.rawValue
                
                ])
            self.refreshConversationTableViewIfNeeded()
        })
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func showMenu(sender: AnyObject) {
        
        let items = [

            MenuItem(title: "客服", iconName: "service", glowColor: RGB(243, g: 88, b: 91, a: 1), index: 0),
            MenuItem(title: "侯猛", iconName: "chat", glowColor: RGB(72, g: 247, b: 240, a: 1), index: 1),
            MenuItem(title: "通讯录", iconName: "address", glowColor: RGB(246, g: 237, b: 75, a: 1), index: 2),
            MenuItem(title: "关于", iconName: "about", glowColor: RGB(169, g: 183, b: 183, a: 1), index: 3)
        
        ]
         
        let menu = PopMenu(frame: self.view.bounds, items: items)
        menu.menuAnimationType = .NetEase
        if menu.isShowed {
            return
        }
        
        menu.didSelectedItemCompletion = { (selectedItem: MenuItem!) -> Void in
            
            switch selectedItem.index{
                
            case 1:
                let conVC = RCConversationViewController()
                conVC.targetId = "houmeng"
                conVC.userName = "侯猛"
                conVC.conversationType = RCConversationType.ConversationType_PRIVATE
                conVC.title = "侯猛"
                self.navigationController?.pushViewController(conVC, animated: true)
                self.tabBarController?.tabBar.hidden = true
                
                break
            default:
                print(selectedItem.index)
            }
            
        }
        
        menu.showMenuAtView(window)
        
    }
    
    func windowNormal(){
        
        let frontToBackWindows = UIApplication.sharedApplication().windows
        
        for windowNormalOne in frontToBackWindows
        {
            if windowNormalOne.windowLevel == UIWindowLevelNormal {
                window = windowNormalOne
            }
        }
        
    }
    
    func clickmenu(){
        print("1")
    }
    func clickmenu1(){
        let conVC = RCConversationViewController()
        conVC.targetId = "houmeng"
        conVC.userName = "侯猛"
        conVC.conversationType = RCConversationType.ConversationType_PRIVATE
        conVC.title = "侯猛"
        self.navigationController?.pushViewController(conVC, animated: true)
        self.tabBarController?.tabBar.hidden = true

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.refreshConversationTableViewIfNeeded()
        self.tabBarController?.tabBar.hidden = false
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let destVC = segue.destinationViewController as? RCConversationViewController
        
        destVC?.targetId = self.conVC.targetId
        destVC?.userName = self.conVC.userName
        destVC?.conversationType = self.conVC.conversationType
        destVC?.title = conVC.title
        
        self.tabBarController?.tabBar.hidden = true
        
    }
    
    override func onSelectedTableRow(conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, atIndexPath indexPath: NSIndexPath!) {
        /*
        // 代码调转会话界面
        let conVC = RCConversationViewController()
        conVC.targetId = model.targetId
        conVC.userName = model.conversationTitle
        conVC.conversationType = RCConversationType.ConversationType_PRIVATE
        conVC.title = model.conversationTitle
        self.navigationController?.pushViewController(conVC, animated: true)
        self.tabBarController?.tabBar.hidden = true
        */
        
        conVC.targetId = model.targetId
        conVC.userName = model.conversationTitle
        conVC.conversationType = RCConversationType.ConversationType_PRIVATE
        conVC.title = model.conversationTitle

        self.performSegueWithIdentifier("tapOnCell", sender: self)
        
    }


}

