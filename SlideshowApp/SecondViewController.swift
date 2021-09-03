//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by チャン　トゥハン on 2021/09/03.
//

import UIKit

class SecondViewController: UIViewController {

   
    @IBOutlet weak var imageView: UIImageView!
    // 引き継ぎ画像
    var image: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageView.image = image
    }
}
