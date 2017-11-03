//
//  TremorTestViewData.swift
//  TremorStat
//
//  Created by Domenico Di Giovanni on 10/28/17.
//  Copyright © 2017 Best Software. All rights reserved.
//

import UIKit

class TremorTestViewData: UIViewController {

    var dataArray = Array<Array<Double>>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool){
        // test to ensure data transfer
        
        for i in 0 ... dataArray.count {
            print("data from viewData: " ,self.dataArray[0][i], "    ", self.dataArray[1][i], "   ", self.dataArray[2][i])
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
