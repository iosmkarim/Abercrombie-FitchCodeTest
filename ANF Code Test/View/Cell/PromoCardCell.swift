//
//  PromoCardCell.swift
//  ANF Code Test
//
//  Created by Md Rezaul Karim on 7/9/21.
//

import UIKit

class PromoCardCell: UITableViewCell {
    
    //MARK:- Outlet
    static let identifier = "PromoCardCell"
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var topDescriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var promoLabel: UILabel!
    @IBOutlet weak var bottomDescriptionLabel: UILabel!
    @IBOutlet weak var titleBtn: UIButton!
    @IBOutlet weak var targetBtn: UIButton!
    
    //MARK:- View
    
    func configureView(dataModel: PromoCardModel) {
        
        //1.background Image
        let imageName = dataModel.backgroundImage
        
        let backgroundImage = UIImage(named: imageName)
        self.backgroundImage.image = backgroundImage

        
        //2. topDescription
        guard let topDescription = dataModel.topDescription else {
            self.topDescriptionLabel.isHidden = true
            return
        }
        self.topDescriptionLabel.text = topDescription
        
        //3. title
        self.titleLabel.text = dataModel.title        
        
        //4. promoMessage
        guard let promoMessage = dataModel.promoMessage else {
            self.promoLabel.isHidden = true
            return
        }
        self.promoLabel.text = promoMessage
        
        //5. bottomDescription
        guard let bottomDescription = dataModel.bottomDescription else {
            self.bottomDescriptionLabel.isHidden = true
            return
        }

        //TODO : refactor below logic
        var new = String()
        let edit = bottomDescription.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        new = edit
        if edit.contains("*") {
            new =  edit.replacingOccurrences(of: "*", with: "", options: .caseInsensitive, range: nil)
        }
        self.bottomDescriptionLabel.text = new

        //TODO: NEED TO WORK WITH WHOLE BUTTON SECTION TO MAKE IT DYNAMIC   
         //6. content
        guard let content = dataModel.content?.first?.title, !content.isEmpty else {
            self.targetBtn.isHidden = true
            return
        }
        self.titleBtn.setTitle(content, for: .normal)
        
        guard let content = dataModel.content?.first?.target, !content.isEmpty else {
            self.targetBtn.isHidden = true
            return
        }
        self.targetBtn.setTitle("Go To", for: .normal)
    }
   
}
