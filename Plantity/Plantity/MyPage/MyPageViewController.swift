//
//  MyPageViewController.swift
//  Plantity
//
//  Created by 최은형 on 2022/07/26.
//
import UIKit

class MyPageViewController: UIViewController {
    @IBOutlet weak var myCardView: UIView!

    @IBOutlet weak var myProgressView: UIProgressView!

    @IBOutlet weak var myImageView: UIImageView!

    @IBOutlet weak var myNameLabel: UILabel!

    @IBOutlet weak var myMedalImageView: UIImageView!

    @IBOutlet weak var myLevelLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAttribute()
    }

    private func setupAttribute() {
        // Corner Radius
        myCardView.clipsToBounds = true
        myCardView.layer.cornerRadius = 20

        myProgressView.clipsToBounds = true
        myProgressView.layer.cornerRadius = 8
        myProgressView.clipsToBounds = true
        myProgressView.layer.sublayers![1].cornerRadius = 8// 뒤에 있는 회색 track
        myProgressView.subviews[1].clipsToBounds = true

        myImageView.clipsToBounds = true
        myImageView.layer.cornerRadius = 82 / 2
    }
}
