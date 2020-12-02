//
//  ViewController.swift
//  viewDidLoadPractice
//
//  Created by Tai Chin Huang on 2020/11/27.
//

import UIKit
import AVFoundation
import SpriteKit

class ViewController: UIViewController {
    
    let player = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let bgGradientLayer = CAGradientLayer()
        bgGradientLayer.frame = view.bounds
        bgGradientLayer.colors = [CGColor(red: 117/255, green: 1, blue: 154/255, alpha: 0.6),CGColor(red: 77/255, green: 1, blue: 87/255, alpha: 0.6),CGColor(red: 7/255, green: 1, blue: 87/255, alpha: 0.6),CGColor(red: 117/255, green: 1, blue: 154/255, alpha: 0.6)]
        // 顏色分布：較淺色、標準色、標準色、較淺色
        bgGradientLayer.startPoint = CGPoint(x: 0.8, y: 1)
        bgGradientLayer.endPoint = CGPoint(x: 0.2, y: 0)
        bgGradientLayer.locations = [0,0.2,0.6,1]
//        view.layer.insertSublayer(bgGradientLayer, at: 0)
        view.layer.addSublayer(bgGradientLayer)
        
        //CapooCat1
//        let imageView1 = UIImageView(frame: CGRect(x: 30, y: 30, width: 279, height: 255))
//        view.addSubview(imageView1)
//        let animatedImage1 = UIImage.animatedImageNamed("0f99cbe2d8934608e572433bc37ab4ffvmdhemPAXa5I1z4y-", duration: 1)
//        imageView1.image = animatedImage1
        //NyanCat1
        let imageView2 = UIImageView(frame: CGRect(x: 0, y: 150, width: 500, height: 487))
        view.addSubview(imageView2)
        let animatedImage2 = UIImage.animatedImageNamed("252efb4e8e924e21b8691fd39f6ff93fNJppwBBABszACcuN-", duration: 2)
        imageView2.image = animatedImage2
        //NyanCat2
//        let imageView3 = UIImageView(frame: CGRect(x: 0, y: 300, width: 473, height: 453))
//        view.addSubview(imageView3)
//        let animatedImage3 = UIImage.animatedImageNamed("cd0f2ec0889a4ce28e28e36ab752716apqC20LnbOXrWIX4i-", duration: 1)
//        imageView3.image = animatedImage3
        //NyanCat Music
        let fileUrl = Bundle.main.url(forResource: "NyanCat", withExtension: "mp3")!
        let playerItem = AVPlayerItem(url: fileUrl)
        player.replaceCurrentItem(with: playerItem)
        player.play()
        
        //back maple（第二層背景） View跟Scene的背景都要改透明才不會蓋到漸層
        let mapleSnowView = SKView(frame: view.frame)
        mapleSnowView.backgroundColor = .clear
        view.addSubview(mapleSnowView)
        
        let mapleSnowScene = SKScene(size: mapleSnowView.frame.size)
        mapleSnowScene.anchorPoint = CGPoint(x: 0.5, y: 1)
        mapleSnowScene.alpha = 0.5 // 雪的透明度（做出景深感）
        mapleSnowScene.backgroundColor = .clear
        
        let emitterNode = SKEmitterNode(fileNamed: "MyParticle")
        mapleSnowScene.addChild(emitterNode!)
        mapleSnowView.presentScene(mapleSnowScene)
        
        //front maple（前景 最前面一層）
        let mapleSnowEmitterCell = CAEmitterCell()
        mapleSnowEmitterCell.contents = UIImage(named: "maplesmall20")?.cgImage
        
        mapleSnowEmitterCell.birthRate = 2  //一秒生幾個
        
        mapleSnowEmitterCell.lifetime = 10  //出現時間
        mapleSnowEmitterCell.lifetimeRange = 5  //出現時間容許範圍
        
        mapleSnowEmitterCell.velocity = -30 //移動速度
        mapleSnowEmitterCell.velocityRange = -20  //移動速度容許範圍
        
        mapleSnowEmitterCell.scale = 0.1 //大小變形
        mapleSnowEmitterCell.scaleRange = 0.5 //大小範圍在1+-0.5之間（0.5~1.5之間隨機）
        
        mapleSnowEmitterCell.yAcceleration = 30 //y軸加速度
        mapleSnowEmitterCell.xAcceleration = 5 //x軸加速度
        
        mapleSnowEmitterCell.spin = -0.5  //旋轉
        mapleSnowEmitterCell.spinRange = 1 //旋轉範圍
        
        mapleSnowEmitterCell.emissionRange = CGFloat.pi //左右落下
        
        let mapleSnowEmitterLayer = CAEmitterLayer()
        mapleSnowEmitterLayer.birthRate = 2  //一秒發射幾次mapleSnowEmitterCell
        mapleSnowEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width/2, y: -100) //發射的位置
        mapleSnowEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0) //發射的尺寸
        mapleSnowEmitterLayer.emitterShape = .cuboid //發射的形狀
        
        mapleSnowEmitterLayer.emitterCells = [mapleSnowEmitterCell]
        view.layer.addSublayer(mapleSnowEmitterLayer)
    }


}

