//
//  ViewController.swift
//  Rbp400
//
//  Created by appdeveloper on 2016/06/20.
//  Copyright © 2016年 ad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var delayTimer : NSTimer?
  var restartTimer : NSTimer?
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var imageView2: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // 最初の画像
    imageView.image = UIImage(named: "off.png")
    imageView2.image = UIImage(named: "on.png")
    
    // 0.png〜9.pngの画像をアニメーションのコマに
    var imgArray : Array<UIImage> = []
    imgArray += [ UIImage(named: "off.png")!, UIImage(named: "on.png")! ]
    var imgArray2 : Array<UIImage> = []
    imgArray2 += [ UIImage(named: "on.png")!, UIImage(named: "off.png")! ]
    
    imageView.animationImages = imgArray
    imageView.animationDuration = 1.0
    imageView.animationRepeatCount = 0
    imageView2.animationImages = imgArray
    imageView2.animationDuration = 1.0
    imageView2.animationRepeatCount = 0
//    imageView.startAnimating()
//    start(self)
    delayTimer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self,
      selector: "delayStart:", userInfo: nil, repeats: true)
    restartTimer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self,
      selector: "reStart:", userInfo: nil, repeats: true)
  }
  override func viewDidAppear(animated: Bool) {
    start(self)
    print("start")
//    imageView.startAnimating()
  }
  func start(sender: AnyObject) {
    // 停止している場合に開始
    if !imageView.isAnimating() {
      imageView.startAnimating()
    }
  }  //
  func start2(sender: AnyObject) {
    // 停止している場合に開始
    if !imageView2.isAnimating() {
      imageView2.startAnimating()
    }
  }  //
  func delayStart(sender:AnyObject!) {
    start2(self)
//    NSThread.sleepForTimeInterval(1.5)
    
//    if imageView.isAnimating() {
//      imageView.stopAnimating()
//    }else {
//      imageView.startAnimating()
//    }
  }
  func reStart(sender:AnyObject!) {
      imageView.stopAnimating()
      imageView.startAnimating()
      imageView2.stopAnimating()
      imageView2.startAnimating()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

