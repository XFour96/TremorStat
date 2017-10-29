//
//  RestTremorTest.swift
//  TremorStat
//
//  Created by ikukushk on 10/28/17.
//  Copyright © 2017 Best Software. All rights reserved.
//

import Foundation
import CoreMotion

class RestTremorTest: ViewController {
    
    var motionManager = CMMotionManager()
    
    var showResults = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        //Create an array of x,y,z rotation coordinates
        var numColumns = 100
        var numRows = 3
        var array = Array<Array<Double>>()
        for rows in 0...numRows {
            array.append(Array(repeating:0, count:numColumns))
        }
        
        
        
        var i: Int=0                                //Instantiating Array control variable
        motionManager.gyroUpdateInterval = 0.1      //Setting up gyroscope measurements interval to 0.1 sec
        
        var timeInstance: Double
        timeInstance=0.0                            //Instantiate test duration control variable  timeInstance
        
        weak var weakSelf = self
        
        motionManager.startGyroUpdates(to: OperationQueue.current!){(data,error) in
            if let myData = data
            {
                //Printing first 5 digits of the x,y,z coordinates
                print ("i=",i,"; x=",Double(round(10000*myData.rotationRate.x)/10000),"; y=",Double(round(1000*myData.rotationRate.y)/1000),"; z=",Double(round(1000*myData.rotationRate.z)/1000))
                //Saving x,y,z data into an array
                array[0][i]=myData.rotationRate.x
                array[1][i]=myData.rotationRate.y
                array[2][i]=myData.rotationRate.z
                //Increment Array control variable and test duration control variable
                timeInstance+=0.1
                i+=1
            }
            
            //Stop gyroscope updates when test time is over
            if (timeInstance>=9.9){
                weakSelf?.motionManager.stopGyroUpdates()
                self.showResults = true
            }
        }
        
       /* if ( self.showResults ){
            viewWillDisappear(false)
            
        }*/
    }
    
    /*override func prepare( for segue: UIStoryboardSegue, sender: Any? ){
        var secondController = segue.destination as! SecondController
    }*/
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Don't forget to reset when view is being removed
        motionManager.stopGyroUpdates()
    }
    
    
    
    
    // THIS IS A TEST MESSAGE
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

