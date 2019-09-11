//
//  TodayViewController.swift
//  Widget
//
//  Created by Andre Pimenta on 28/07/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

import UIKit
import NotificationCenter

struct Shared:Decodable {
  let text: String
}

class TodayViewController: UIViewController, NCWidgetProviding {
  @IBOutlet weak var textLabel: UILabel!
  
  //CHANGE THE GROUP NAME
  let userDefaults = UserDefaults(suiteName: "group.com.createwidget.pimenta")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view from its nib.
    
	//ADD THIS
    do{
      let shared = userDefaults?.string(forKey: "data")
      if(shared != nil){
        let data = try JSONDecoder().decode(Shared.self, from: shared!.data(using: .utf8)!)
        textLabel.text = data.text
      }
    }catch{
      print(error)
    }
  }
  
  func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResult.Failed
    // If there's no update required, use NCUpdateResult.NoData
    // If there's an update, use NCUpdateResult.NewData
    
    completionHandler(NCUpdateResult.newData)
  }
  
}
