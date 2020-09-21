//
//  SecondViewController.swift
//  SocialSharingDemo
//
//  Created by Volodymyr Ostapyshyn on 19.09.2020.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import UIKit
import FacebookShare
import TwitterKit

class SecondViewController: UIViewController {
    
    var restaurantImages = ["Cafe Deadend.jpg", "homei.jpg", "teakha.jpg", "Cafe Loisl.jpg", "petiteoyster.jpg", "For Kee Restaurant.jpg", "posatelier.jpg", "Bourke Street Bakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "Five Leaves.jpg", "Cafe Lore.jpg", "Confessional.jpg", "Barrafina.jpg", "Donostia.jpg", "royaloak.jpg", "CASK Pub and Kitchen.jpg"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func socialShareFacebook(_ sender: UIBarButtonItem) {
        print("OK")
        // Get the selected row
        //let buttonPosition = sender.convert(CGPoint.zero, to: tableView)
        
//        guard let indexPath = tableView.indexPathForRow(at: buttonPosition) else {
//            return
//        }
        
        // Display the share menu
        let shareMenu = UIAlertController(title: nil, message: "Share using", preferredStyle: .actionSheet)
        let twitterAction = UIAlertAction(title: "Twitter", style: .default) { (action) in
            
            let selectedImageName = self.restaurantImages[1]
            
            guard let selectedImage = UIImage(named: selectedImageName) else {
                return
            }
            print("1!")
            let composer = TWTRComposer()

            composer.setText("Love this restaurant!")
            composer.setImage(selectedImage)

            composer.show(from: self, completion: { (result) in
                if (result == .done) {
                    print("Successfully composed Tweet")
                } else {
                    print("Cancelled composing!!!")
                }
            })

        }
        
        let facebookAction = UIAlertAction(title: "Facebook", style: .default) { (action) in
            let selectedImageName = self.restaurantImages[1]
            guard let selectedImage = UIImage(named: selectedImageName) else { return
            }
            let photo = SharePhoto(image: selectedImage, userGenerated: false)
            let content = SharePhotoContent()
            content.photos = [ photo ]
            let shareDialog = ShareDialog(fromViewController: self, content: content, delegate: nil)
            shareDialog.show()
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        shareMenu.addAction(twitterAction)
        shareMenu.addAction(facebookAction)
        shareMenu.addAction(cancelAction)
        
        if let popoverController = shareMenu.popoverPresentationController {
            popoverController.barButtonItem = sender
        }
        
        self.present(shareMenu, animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
