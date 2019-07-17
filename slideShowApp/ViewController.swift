//
//  ViewController.swift
//  slideShowApp
//
//  Created by sora on 2019/07/16.
//  Copyright © 2019 sora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    var imageArray = [UIImage]()
    var imageCount = 0
    var timer: Timer!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let erika = UIImage(named: "erika.jpeg")
        let nanamiasuka = UIImage(named: "nanamiasuka.jpeg")
        let mono = UIImage(named: "monologue.png")
        let fanta = UIImage(named: "nogifanta.png")
        
        
        imageArray = [erika!, nanamiasuka!, mono!, fanta!]
        imageView.image = UIImage(named: "erika.jpng")

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のImageViewControllerを取得する
        let imageViewController:ImageViewController = segue.destination as! ImageViewController
        // 遷移先のImageViewControllerで宣言しているimageに値を代入して渡す
        imageViewController.picture = self.imageView.image
    }
    
    @IBAction func go(_ sender: Any) {
        
        self.imageCount += 1
        if imageCount > 3 {
            self.imageCount = 0
//          self.imageView.image = UIImage(named: "erika.jpng")いらない
        }

        self.imageView.image = imageArray[imageCount]

    }
    
    
    @IBAction func back(_ sender: Any) {
        
        self.imageCount -= 1
        if imageCount < 0 {
            self.imageCount = 3
//            self.imageView.image = UIImage(named: "fanta.png")
        }

        self.imageView.image = imageArray[imageCount]

    }
    
    
    @IBAction func startStop(_ sender: Any) {
        
        startButton.isEnabled = false
        backButton.isEnabled = false
        
        if self.timer == nil {
        
            timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true, block: {(timer)in
            
                if self.imageCount > 3 {
                    self.imageCount = 0
                    self.imageView.image = UIImage(named: "erika.jpeg")
                }else{
                    self.imageView.image = self.imageArray[self.imageCount]
                }
                    self.imageCount += 1
            })
        }else {
            self.timer.invalidate()
            self.timer = nil
            startButton.isEnabled = true
            backButton.isEnabled = true
        }
    }

}
