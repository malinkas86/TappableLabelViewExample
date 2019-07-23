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

    @IBOutlet weak var tappableLabelView: TappableLabelView!
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
        tappableLabelView.options = ConfigurationOptions(textAttributes: textStyle.attributes,
                                                         highlightedTextAttributes: highlightedTextStyle.attributes,
                                                         alignment: .center,
                                                         isUnderline: true,
                                                         delegate: self)
        tappableLabelView.text = "I have a UICollectionViewCell drawn out in a xib and accompanied by swift class file. These two files are part of my app's UI framework target (called SomeUI). In the view controller of my collection view (in the app target) I register the nib as a collection view cell. My view controller code is as follows hello I am young UICollectionViewCell"
        tappableLabelView.tappableStrings = ["collection", "register", "cell.", "UICollectionViewCell"]
    }

}

// MARK: - TappableLabelViewDelegate
extension ViewController: TappableLabelViewDelegate {
    
    func didTap(text: String, indexInText: Int, index: Int) {
        print("text: \(text) indexInText: \(indexInText) index: \(index)")
    }

}
