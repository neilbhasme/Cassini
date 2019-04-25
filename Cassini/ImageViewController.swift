//
//  ImageViewController.swift
//  Cassini
//
//  Created by Neil R.Bhasme on 23/04/2019.
//  Copyright © 2019 Neil R.Bhasme. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    var imageURL: URL? {
        didSet {
            imageView?.image = nil
            spinner?.stopAnimating()
            if view.window != nil {
            fetchImage()
            }
        }
    }
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    //Pinch to zoom can be found in lecture 9 last 10-15 mins
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView?.image == nil {
            fetchImage()
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    private func fetchImage() {
        if let url = imageURL {
            spinner?.startAnimating()
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                let urlContents = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    if let imageData = urlContents, url == self?.imageURL {
                        self?.imageView?.image = UIImage(data: imageData)
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if imageURL == nil {
//            imageURL = DemoURLs.stanford
//        }
    }
}
