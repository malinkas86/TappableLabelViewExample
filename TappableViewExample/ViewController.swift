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
                                           alignment: .center,
                                           isUnderline: true,
                                           wordSpacing: 5,
                                           lineSpacing: 6,
                                           delegate: self)
        tappableLabelView = TappableLabelView(frame: .zero, options: options)
        tappableLabelView.translatesAutoresizingMaskIntoConstraints = false
        tappableLabelView.text = "I have a UICollectionViewCell drawn out in a xib and accompanied by swift class file. These two files are part of my app's UI framework target (called SomeUI). In the view controller of my collection view (in the app target) I register the nib as a collection view cell. My view controller code is as follows hI have a UICollectionViewCell drawn out in a xib"
        tappableLabelView.tappableStrings = ["collection", "register", "cell.", "UICollectionViewCell"]
        view.addSubview(tappableLabelView)
        NSLayoutConstraint.activate([
                tappableLabelView.heightAnchor.constraint(equalToConstant: 200),
                tappableLabelView.widthAnchor.constraint(equalTo: view.widthAnchor),
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
            print("text: \(text) indexInText: \(indexInText) index: \(index)")
        }
    }

}
