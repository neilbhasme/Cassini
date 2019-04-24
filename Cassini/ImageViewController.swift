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
            imageView.image = nil
            if view.window != nil {
            fetchImage()
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    private func fetchImage() {
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                imageView.image = UIImage(data: imageData)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if imageURL == nil {
            imageURL = DemoURLs.stanford
        }
    }
}
