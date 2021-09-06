//
//  ViewController.swift
//  SlideshowApp
//
//  Created by チャン　トゥハン on 2021/09/03.
//

import UIKit

class ViewController: UIViewController {
    //
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var playBtn: UIButton!
    // 画像ファイル名の配列
    var imageNames = ["phuquoc.jpeg","fansipan.jpeg","danang.jpeg","dalat.png","sapa.jpeg",]
    // 表示中の画像配列番号
    var showIndex = 0
    // タイマー
    var timer: Timer!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showImage()
    }
    // showIndexの画像を表示
   func showImage() {
       imageView.image = UIImage(named: imageNames[showIndex])
   }
       
    @IBAction func nextImageBtn(_ sender: Any) {
        // showIndexをカウントアップ
        showIndex += 1
        // 最終番号を超えたら0に戻す
        if showIndex >= imageNames.count {
            showIndex = 0
        }
        // 画像表示
        showImage()
    }
    @IBAction func backImageBtn(_ sender: Any) {
        // showIndexをカウントダウン
       showIndex -= 1
       // 最初より前に戻ったら最終番号にする
       if showIndex < 0 {
           showIndex = imageNames.count - 1
       }
       // 画像表示
       showImage()
    }
    @IBAction func playSlideshowBtn(_ sender: Any) {
        if timer == nil {
           // スライドショー開始
           timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
           // ボタンをスライドショー開始状態にする
            playBtn.setTitle("停止", for: .normal)
            nextBtn.isEnabled = false
            backBtn.isEnabled = false
       } else {
           // スライドショー停止
           timer.invalidate()
           timer = nil
           // ボタンをスライドショー停止状態にする
        playBtn.setTitle("再生", for: .normal)
        nextBtn.isEnabled = true
        backBtn.isEnabled = true
       }
    }
    @objc func updateTimer() {
       // showIndexをカウントアップ
       showIndex += 1
       // 最終番号を超えたら0に戻す
       if showIndex >= imageNames.count {
           showIndex = 0
       }
       // 画像表示
       showImage()
   }
    // 画面遷移時の処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // スライドショーを停止してから画面遷移する
        if timer != nil {
            // スライドショー停止
            timer.invalidate()
            timer = nil
            // ボタンをスライドショー停止状態にする
            playBtn.setTitle("再生", for: .normal)
            nextBtn.isEnabled = true
            backBtn.isEnabled = true
        }
        // 表示中の画像を引き継ぎ
        let secondViewController = segue.destination as! SecondViewController
        secondViewController.image = imageView.image
    }
        
    // 画面遷移の戻り用メソッド
    @IBAction func unwind(_ segue:UIStoryboardSegue) {
    }
    
}

