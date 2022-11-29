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
    @IBOutlet weak var nicknameField: UITextField!
    @IBOutlet weak var adaptDatePicker: UIDatePicker!
    
    @IBOutlet weak var addButton: UIButton!
    
    let imagePickerViewController = UIImagePickerController()
    var plantTypeCode: String = "" // 식물코드
    
    var selectedPlant: SearchPlantModel = SearchPlantModel(plantIdx: 0, cntntsNo: "", cntntsSj: "", plntbneNm: "", plntzrNm: "", adviseInfo: "", orgplceInfo: "", lighttdemanddoCodeNm: "", ignSeasonCodeNm: "", flclrCodeNm: "", watercycleSprngCodeNm: "", managelevelCode: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAttribute()

        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        addImageView.addGestureRecognizer(tapGR)
        addImageView.isUserInteractionEnabled = true
        
        imagePickerViewController.delegate = self
        
        // 식물종류 옵저버
        
        NotificationCenter.default.addObserver(self, selector: #selector(didRecieveTypeNotification(_:)), name: Notification.Name("plantType"), object: nil)
    }
    
    @objc func didRecieveTypeNotification(_ notification: NSNotification) {
        let plantData: SearchPlantModel = notification.object as! SearchPlantModel
        
        plantTypeField.text = plantData.cntntsSj
        plantTypeCode = plantData.cntntsNo
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
        // 식물종류 필드 클릭시 식물종류 검색 페이지로 이동
        let storyboard=UIStoryboard(name: "MainPage", bundle: nil)
        
        guard let selectorVC = storyboard.instantiateViewController(identifier: "TypeSelectorViewController") as? TypeSelectorViewController else { return }
        
        self.present(selectorVC, animated: true, completion: nil)
    }
    
    @IBAction func closeClicked(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        // 내 식물로 추가하기 클릭시 POST
        postData()
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

extension AddPlantViewController {
    private func postData() {
        // 날짜 포맷팅
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateStr = dateFormatter.string(from: adaptDatePicker.date)
        
        // To Server
        //let input = AddDataInput(plantName: nicknameField.text, plantType: plantTypeField.text, plantImage: addImageView.image, plantAdaptTime: dateStr)
        //let input = AddDataInput(plantName: plantTypeField.text, plantNickName: nicknameField.text, plantType: String?, plantAdaptTime: dateStr)
        let input = AddDataInput(plantName: plantTypeField.text, plantNickName: nicknameField.text, plantAdaptTime: dateStr)
        
        
        AddDataManager().addDataManager(addImageView.image, input, self, plantTypeCode)
    }
}
