//
//  ViewController.swift
//  Lab 7
//
//  Created by Basil Latif on 4/10/17.
//  Copyright © 2017 Basil Latif. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monkey: UIImageView!
    
    @IBOutlet weak var apple: UIImageView!
    
    @IBOutlet weak var apple2: UIImageView!
    
    var timer : Timer?
    
    var counter  = 0
    
    let winner = false
    
    @IBOutlet weak var timerValue: UILabel!
    
    @IBOutlet weak var winOrLose: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.monkey.image = UIImage(named:"monkey.jpg")
        self.apple.image = UIImage(named:"apple.jpg")
         self.apple2.image = UIImage(named:"apple.jpg")
        timer = Timer();
        startTimer();
      
    }
    
    @IBAction func up(_ sender: Any) {
        var frame  = self.monkey.frame
        frame.origin.y -= 10
        self.monkey.frame =  frame
        
        if(viewIntersectsView(monkey, second_View: apple))
        {
            self.apple.isHidden = true
            winOrLoser();
        }
        else if (viewIntersectsView(monkey, second_View: apple2))
        {
            self.apple2.isHidden = true
            winOrLoser();
        }
    }
    
    @IBAction func left(_ sender: Any) {
        var frame  = self.monkey.frame
        frame.origin.x -= 10
        self.monkey.frame =  frame
        
        if(viewIntersectsView(monkey, second_View: apple))
        {
            self.apple.isHidden = true
            winOrLoser();
        }
        else if (viewIntersectsView(monkey, second_View: apple2))
        {
            self.apple2.isHidden = true
            winOrLoser();
        }
    }
    
    @IBAction func right(_ sender: Any) {
        var frame  = self.monkey.frame
        frame.origin.x += 10
        self.monkey.frame =  frame
        
        if(viewIntersectsView(monkey, second_View: apple))
        {
            self.apple.isHidden = true
            winOrLoser();
        }
        else if (viewIntersectsView(monkey, second_View: apple2))
        {
            self.apple2.isHidden = true
            winOrLoser();
        }
    }
    
    @IBAction func down(_ sender: Any) {
        var frame  = self.monkey.frame
        frame.origin.y += 10
        self.monkey.frame =  frame
        
        if(viewIntersectsView(monkey, second_View: apple))
        {
            self.apple.isHidden = true
            winOrLoser();
        }
        else if (viewIntersectsView(monkey, second_View: apple2))
        {
            self.apple2.isHidden = true
            winOrLoser();
        }
    }
    
    func startTimer()
    {
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.count), userInfo: nil, repeats: true)
    }


    func count()
    {
    counter = counter + 1
    timerValue.text  = String(counter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func viewIntersectsView(_ first_View: UIView, second_View:UIView) -> Bool
    {
        
        return first_View.frame.intersects(second_View.frame)
    }

    func winOrLoser(){
    if (apple.isHidden==true && apple2.isHidden==true)
    {
        timer?.invalidate()
        if (counter < 10){
        self.winOrLose.text = "You won the game. Congratulations!"
        }
    }
}
}
