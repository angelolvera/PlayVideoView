//
//  PlayVideoView.swift
//  PlayVideoView
//
//  Created by Angel Olvera on 2019-11-07.
//  Copyright © 2019 Angel Olvera. All rights reserved.
//

import UIKit
import AVFoundation

class PlayVideoView: UIView {

    let playVideoLayer = AVPlayerLayer()
    private (set) var player: AVQueuePlayer?
    var playerLooper: AVPlayerLooper?

    override init(frame: CGRect) {
        super.init(frame: frame)
        addPlayVideoLayer()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addPlayVideoLayer()
    }
    
    private func addPlayVideoLayer() {
        playVideoLayer.frame = bounds
        playVideoLayer.opacity = 0.75
        playVideoLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playVideoLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playVideoLayer.frame = bounds
    }
    
    func setVideo(url: URL) {
        let item = AVPlayerItem(url: url)
        player = AVQueuePlayer(playerItem: item)
        playerLooper = AVPlayerLooper(player: player!, templateItem: item)
        playVideoLayer.player = player!
        player!.volume = 0.0
    }

}
