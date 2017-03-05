//
//  SettingsViewController.swift
//  tippy
//
//  Created by Marwaha, Mohit on 3/5/17.
//  Copyright © 2017 Marwaha, Mohit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipSegmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the view with the current default tip percentage
        let defaults = UserDefaults.standard
        let defaultTipSegmentIndex = defaults.integer(forKey: "default_tip_segment_index")
        
        print(defaultTipSegmentIndex)
        
        defaultTipSegmentControl.selectedSegmentIndex=defaultTipSegmentIndex
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("settings view will disappear")
        updateDefaultTip(self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func updateDefaultTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(defaultTipSegmentControl.selectedSegmentIndex, forKey: "default_tip_segment_index")
        print("map=")
        print(defaults.value(forKey: "default_tip_segment_index") ?? 0)
        defaults.synchronize()
    }
}
