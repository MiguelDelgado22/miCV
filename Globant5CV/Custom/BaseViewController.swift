
import UIKit

class BaseViewController: UIViewController {
    var contentView: UIImageView?
    var lbTitle: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configBase()
    }
    
    private func configBase() {
        let screenSize: CGRect = UIScreen.main.bounds
        let positionXY = BaseData.positionXYcontentView.rawValue
        
        let imageBackground = UIImage(named: NameOfImage.imgBackgroundScreen.rawValue)

        contentView = UIImageView(image: imageBackground)
        lbTitle = UILabel.init(frame: CGRect.init(x: BaseData.positionXYcontentView.rawValue, y: BaseData.labelPositionY.rawValue, width: Double(screenSize.size.width), height: BaseData.labelPositionHeigth.rawValue))

        if let content = contentView {
            content.alpha = CGFloat(BaseData.alphaNum.rawValue)
            content.frame = CGRect(x: CGFloat(positionXY), y: CGFloat(positionXY), width: screenSize.width, height: screenSize.height)
            
            self.view.insertSubview(content, at: TableInformationViewData.numeroOfOptional.rawValue)
        }
    }
}

