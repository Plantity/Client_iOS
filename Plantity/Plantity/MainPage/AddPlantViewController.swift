//
//  AddPlantViewController.swift
//  Plantity
//
//  Created by 최은형 on 2022/08/17.
//

import UIKit

class AddPlantViewController: UIViewController {
    
    @IBOutlet weak var addImageView: UIImageView!
    
    let imagePickerViewController = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        addImageView.addGestureRecognizer(tapGR)
        addImageView.isUserInteractionEnabled = true
        
        imagePickerViewController.delegate = self
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            self.imagePickerViewController.sourceType = .photoLibrary
            self.present(imagePickerViewController, animated: true, completion: nil)
        }
    }

}

extension AddPlantViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            addImageView.image = image
        }
    }
}
