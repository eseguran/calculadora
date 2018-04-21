//
//  ViewController.swift
//  calculadora
//
//  Created by Eddy Segura on 4/14/18.
//  Copyright © 2018 Eddy Segura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberOnScreen: Double = 0;
    var previousNumber: Double = 0;
    var performingMath = false;
    var operation = 0;
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton)
    {
        if performingMath == true {
           label.text! = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false;
            
        }else{
            
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
       
    }
    
    @IBAction func operators(_ sender: UIButton)
    {
        if label.text != "" && sender.tag != 11 && sender.tag != 12 && sender.tag != 13 && sender.tag != 18{
            previousNumber = Double(label.text!)!
            if sender.tag == 14{
                 label.text = "/";
            }
            else  if sender.tag == 15{
                label.text = "x";
            }
            else  if sender.tag == 16{
                label.text = "-";
            }
            else  if sender.tag == 17{
                label.text = "+";
            }
          performingMath = true;
            operation = sender.tag;
        }
        else  if sender.tag == 18
        {
            if operation == 14{
                label.text = String(previousNumber / numberOnScreen);
            }
            else  if operation == 15{
                label.text = String(previousNumber * numberOnScreen);
            }
            else  if operation == 16{
                label.text = String(previousNumber - numberOnScreen);
            }
            else  if operation == 17{
                label.text = String(previousNumber + numberOnScreen);
            }
    }
        else  if sender.tag == 11{
            label.text = "";
            numberOnScreen = 0;
            previousNumber = 0;
            operation = 0;
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

