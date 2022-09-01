//
//  AddPlantViewController.swift
//  Plantity
//
//  Created by 최은형 on 2022/08/17.
//

import UIKit

class AddPlantViewController: UIViewController {
    
    @IBOutlet weak var addImageView: UIImageView!
    
    @IBOutlet weak var plantTypeField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    let imagePickerViewController = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAttribute()

        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        addImageView.addGestureRecognizer(tapGR)
        addImageView.isUserInteractionEnabled = true
        
        imagePickerViewController.delegate = self
    }
    
    func setupAttribute() {
        addImageView.clipsToBounds = true
        addImageView.contentMode = .center
        
        addButton.layer.cornerRadius = 10
        addButton.clipsToBounds = true
        
        plantTypeField.placeholder = ""
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            self.imagePickerViewController.sourceType = .photoLibrary
            self.present(imagePickerViewController, animated: true, completion: nil)
            
        }
    }

    @IBAction func plantTypeClicked(_ sender: UITextField) {
        print("클릭")
        // 식물종류 필드 클릭시 식물종류 검색 페이지로 이동
        let storyboard=UIStoryboard(name: "MainPage", bundle: nil)
        
        guard let selectorVC = storyboard.instantiateViewController(identifier: "PlantSelectorViewController") as? PlantSelectorViewController else { return }
        
        self.present(selectorVC, animated: true, completion: nil)
    }
    
    @IBAction func closeClicked(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}

extension AddPlantViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            addImageView.image = image
            addImageView.contentMode = .scaleToFill
        }
        
        self.dismiss(animated: true)
    }
}
