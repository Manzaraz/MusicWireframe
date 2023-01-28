//
//  ViewController.swift
//  MusicWireframe
//
//  Created by Christian Manzaraz on 26/01/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var albumImageView: UIImageView!
    
    @IBOutlet var reverseButton: UIButton!
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var forwardButton: UIButton!
    
    @IBOutlet var reverseBackground: UIView!
    @IBOutlet var playPauseBackground: UIView!
    @IBOutlet var forwardBackground: UIView!
    
    var isPlaying: Bool = true {
        didSet {
            playPauseButton.isSelected = isPlaying
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        [reverseBackground, playPauseBackground, forwardBackground].forEach { view in
            view?.layer.cornerRadius = view!.frame.height / 2
            view?.clipsToBounds = true
            view?.alpha = 0.0
        }
        
    }

    @IBAction func playPauseButtonTapped() {
        isPlaying.toggle()
        
        if isPlaying {
            UIView.animate(
                withDuration: 0.8,
                delay: 0,
                usingSpringWithDamping: 0.6,
                initialSpringVelocity: 0.1,
                options: [],
                animations: {
                    self.albumImageView.transform = CGAffineTransform.identity
                },
                completion: nil
            )
        } else {
            UIView.animate(withDuration: 0.5) {
                self.albumImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }
    }
    
}

