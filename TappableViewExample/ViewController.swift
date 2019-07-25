//
//  ViewController.swift
//  TappableViewExample
//
//  Created by Malinka S on 7/18/19.
//  Copyright © 2019 malinka. All rights reserved.
//

import UIKit
import TappableLabelView
import Marker

class ViewController: UIViewController {
    
    var tappableLabelView: TappableLabelView!

    private let textStyle = TextStyle(font: UIFont.systemFont(ofSize: 12),
                                   textColor: UIColor(red: 0.2, green: 0.2, blue: 0.22, alpha: 1),
                                   characterSpacing: nil,
                                   lineSpacing: 0,
                                   lineHeightMultiple: 30,
                                   minimumLineHeight: 12,
                                   maximumLineHeight: 14,
                                   paragraphSpacing: 0,
                                   paragraphSpacingBefore: 0,
                                   textAlignment: .center,
                                   lineBreakMode: .byWordWrapping,
                                   textTransform: .none)
    
    private let highlightedTextStyle = TextStyle(font: UIFont.systemFont(ofSize: 12),
                                      textColor: .blue,
                                      characterSpacing: nil,
                                      lineSpacing: 0,
                                      lineHeightMultiple: 30,
                                      minimumLineHeight: 12,
                                      maximumLineHeight: 14,
                                      paragraphSpacing: 0,
                                      paragraphSpacingBefore: 0,
                                      textAlignment: .center,
                                      lineBreakMode: .byWordWrapping,
                                      textTransform: .none)
    override func viewDidLoad() {
        super.viewDidLoad()
        let options = ConfigurationOptions(textAttributes: textStyle.attributes,
                                           highlightedTextAttributes: highlightedTextStyle.attributes,
                                           alignment: .justified,
                                           isUnderline: true,
                                           wordSpacing: 5,
                                           lineSpacing: 6,
                                           delegate: self)
        tappableLabelView = TappableLabelView(frame: .zero, options: options)
        tappableLabelView.translatesAutoresizingMaskIntoConstraints = false
        tappableLabelView.text = "Waterfalls are commonly formed in the upper course of a river in steep mountains.[1] Because of their landscape position, many waterfalls occur over bedrock fed by little contributing area, so may be ephemeral and flow only during rainstorms or significant snowmelt. The further downstream, the more perennial a waterfall can be. Waterfalls can have a wide range of widths and depths."
        tappableLabelView.tappableStrings = ["Waterfalls", "rainstorms", "snowmelt.", "formed"]
        view.addSubview(tappableLabelView)
        NSLayoutConstraint.activate([
                tappableLabelView.heightAnchor.constraint(equalToConstant: 200),
                tappableLabelView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tappableLabelView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tappableLabelView.topAnchor.constraint(equalTo: view.topAnchor)
            ])
    }

}

// MARK: - TappableLabelViewDelegate
extension ViewController: TappableLabelViewDelegate {
    
    func didTap(tappableLabelView: TappableLabelView, text: String, indexInText: Int, index: Int) {
        if self.tappableLabelView == tappableLabelView {
            let alert = UIAlertController(title: "Yay!!!",
                                          message: "text: \(text) indexInText: \(indexInText) index: \(index)",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

}
