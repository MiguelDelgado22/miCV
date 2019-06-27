//
//  BaseViewController.swift
//  CV_Miguel_Delgado
//
//  Created by Miguel Angel Delgado Alcantara on 6/27/19.
//  Copyright © 2019 Miguel Angel Delgado Alcantara. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var contentView: UIImageView!
    var labelTitulo: UILabel?
    
    @IBInspectable var TitleViewController: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        configBase()
        // Do any additional setup after loading the view.
    }
    
    func configBase(){
        let screenSize: CGRect = UIScreen.main.bounds
        
        let imageBackground = UIImage(named: NameOfImage.IMG_BACKGROUND_SCREEN.rawValue)
        contentView = UIImageView(image: imageBackground)
        contentView?.alpha = 0.5
        contentView?.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        
        labelTitulo = UILabel.init(frame: CGRect.init(x: 16, y: 34, width: 343, height: 63))
        labelTitulo?.layoutIfNeeded()
        labelTitulo?.textColor = UIColor.black
        labelTitulo?.textAlignment = .center
        labelTitulo?.backgroundColor = UIColor.clear
        labelTitulo?.font = UIFont.boldSystemFont(ofSize: 23.0)
        labelTitulo?.text = TitleViewController
        
        self.view.insertSubview(contentView, at: 0)
        self.view.addSubview(labelTitulo!)
        
        
    }

}
