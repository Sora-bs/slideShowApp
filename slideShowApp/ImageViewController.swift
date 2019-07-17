//
//  imageViewController.swift
//  slideShowApp
//
//  Created by sora on 2019/07/16.
//  Copyright © 2019 sora. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    
    @IBOutlet weak var image: UIImageView!
    var picture: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        image.image = self.picture

    }

    
    @IBAction func backPage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
