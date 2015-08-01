//
//  DetailViewController.swift
//  Sample
//
//  Created by 竹内大貴 on 2015/08/01.
//  Copyright (c) 2015年 竹内大貴. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.valueForKey("timeStamp")!.description
            }
        }
    }
    
    func configureImageView() {
        
        var myImageView: UIImageView!

        // 表示する画像を設定する.
        let myImage = UIImage(named: "Olympic-logo.png")
        
        var width = myImage!.size.width
        var height = myImage!.size.height
        var screenWidth = self.view.bounds.width

        // UIImageView インスタンス生成
        myImageView = UIImageView(image: myImage)
        
        // 画像サイズをスクリーン幅に合わせる
        var scale = screenWidth / width
        var rect:CGRect = CGRectMake(0, 0, width*scale, height*scale)
        
        // ImageView frame をCGRectMakeで作った矩形に合わせる
        myImageView!.frame = rect;
        
        // 画像の表示する座標を指定する.
        myImageView.layer.position = CGPoint(x: self.view.bounds.width/2, y: 200.0)

        // UIImageViewをViewに追加する.
        self.view.addSubview(myImageView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        // UIImageViewをViewに追加する.
        self.configureImageView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

