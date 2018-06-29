//
//  ViewController.swift
//  DPImageSlideShow
//
//  Created by danielpluvia on 06/23/2018.
//  Copyright (c) 2018 danielpluvia. All rights reserved.
//

import UIKit
import DPImageSlideShow

class ViewController: UIViewController {

    @IBOutlet weak var slideView: DPImageSlideShowView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension ViewController {
    func setup() {
        let colors: [UIColor] = [.red, .black, .green, .yellow]
        var views: [UIImageView] = []
        for color in colors {
            let view = UIImageView(frame: .zero)
            view.backgroundColor = color
            views.append(view)
        }
        self.slideView.setup(views: views)
    }
}

