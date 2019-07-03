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
    }

    func configBase() {
        let screenSize: CGRect = UIScreen.main.bounds
        let positionXY = BaseData.positionXYcontentView.rawValue

        let imageBackground = UIImage(named: NameOfImage.IMG_BACKGROUND_SCREEN.rawValue)
        contentView = UIImageView(image: imageBackground)
        contentView?.alpha = CGFloat(BaseData.alphaNum.rawValue)
        contentView?.frame = CGRect(x: CGFloat(positionXY), y: CGFloat(positionXY), width: screenSize.width, height: screenSize.height)
        labelTitulo = UILabel.init(frame: CGRect.init(x: BaseData.labelPositionX.rawValue, y: BaseData.labelPositionY.rawValue, width: BaseData.labelPositionWith.rawValue, height: BaseData.labelPositionHeigth.rawValue))
        labelTitulo?.layoutIfNeeded()
        labelTitulo?.textColor = UIColor.black
        labelTitulo?.textAlignment = .center
        labelTitulo?.backgroundColor = UIColor.clear
        labelTitulo?.font = UIFont.boldSystemFont(ofSize: CGFloat(sizeFont.fontBase.rawValue))
        labelTitulo?.text = TitleViewController

        self.view.insertSubview(contentView, at: TableInformationViewData.numeroOfOptional.rawValue)
        self.view.addSubview(labelTitulo!)
    }
}
