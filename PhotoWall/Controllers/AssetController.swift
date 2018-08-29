//
//  AssetController.swift
//  PhotoWall
//
//  Created by Colin Harris on 8/29/18.
//  Copyright © 2018 Colin Harris. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class AssetController: UIViewController {

    @IBOutlet var videoView: UIView!
    @IBOutlet var imageView: UIImageView!
    
    var wallAsset: WallAsset?
    var videoPlayer: AVPlayer?
    var videoLayer: AVPlayerLayer?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let asset = wallAsset {
            imageView.image = asset.image()
            videoPlayer = AVPlayer(url: asset.videoUrl)
            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: videoPlayer!.currentItem, queue: nil) { _ in
                self.imageView?.isHidden = false
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = videoPlayer {
            NotificationCenter.default.removeObserver(player.currentItem as Any)
        }
    }
    
    @IBAction
    func deleteClicked() {
        print("deleteClicked")
    }
    
    @IBAction
    func uploadClicked() {
        print("uploadClicked")
    }
    
    @IBAction
    func printClicked() {
        print("printClicked")
    }
    
    @IBAction
    func playClicked() {
        print("playClicked")
        
        if videoLayer == nil {
            videoLayer = AVPlayerLayer(player: videoPlayer!)
            videoLayer!.frame = videoView.bounds
            videoView.layer.addSublayer(videoLayer!)
        }
        
        self.videoPlayer?.seek(to: .zero)
        videoPlayer?.play()
        imageView?.isHidden = true
    }
}
