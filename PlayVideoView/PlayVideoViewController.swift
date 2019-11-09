//
//  PlayVideoViewController.swift
//
//  Created by Angel Olvera on 2019-05-27.
//  Copyright © 2019 Angel Olvera. All rights reserved.
//

import UIKit
import AVFoundation

class PlayVideoViewController: UIViewController {
    
    @IBOutlet weak var playVideoView: PlayVideoView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = Bundle.main.url(forResource: "test-video", withExtension: "m4v") {
            playVideoView.setVideo(url: url)
            let notificationCenter = NotificationCenter.default
            notificationCenter.addObserver(self, selector: #selector(onWillResignActive), name: UIApplication.willResignActiveNotification, object: nil)
            notificationCenter.addObserver(self, selector: #selector(onDidBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        playVideoView.player?.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        playVideoView.player?.pause()
        if isMovingFromParent {
            NotificationCenter.default.removeObserver(self)
        }
    }
    
    // MARK: - Interruption handling
    @objc func onDidBecomeActive() {
        playVideoView.player?.play()
    }
    
    @objc func onWillResignActive() {
        playVideoView.player?.pause()
    }
}

