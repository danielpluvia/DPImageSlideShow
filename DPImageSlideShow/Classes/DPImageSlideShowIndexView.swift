//
//  DPImageSlideShowIndexView.swift
//  DPImageSlideShow
//
//  Created by Xueqiang Ma on 24/6/18.
//

import UIKit

class DPImageSlideShowIndexView: UIView {

    var horizontalBarViewLeftAnchor: NSLayoutConstraint?
    var count: Int = 1
    var widthRatio: CGFloat = 0.8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}

extension DPImageSlideShowIndexView {
    
    func setup() {
        for v in self.subviews {
            v.removeFromSuperview()
        }
        self.setupBgView()
        self.setupHorizontalView()
    }
    
    fileprivate func setupBgView() {
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Add a Stack View
        let stackView = UIStackView()
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":stackView]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":stackView]))
        
        for _ in 0..<self.count {
            let newBGView = UIView()
            let newTopView = UIView()
            newBGView.addSubview(newTopView)
            stackView.addArrangedSubview(newBGView)
            newBGView.translatesAutoresizingMaskIntoConstraints = false
            newTopView.translatesAutoresizingMaskIntoConstraints = false
            newBGView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":newTopView]))
            newTopView.widthAnchor.constraint(equalTo: newBGView.widthAnchor, multiplier: self.widthRatio).isActive = true
            newTopView.centerXAnchor.constraint(equalTo: newBGView.centerXAnchor).isActive = true
            newBGView.backgroundColor = .clear
            newTopView.backgroundColor = .lightGray
        }
    }
    
    fileprivate func setupHorizontalView() {
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = .clear
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(horizontalBarView)
        
        self.horizontalBarViewLeftAnchor = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        self.horizontalBarViewLeftAnchor?.isActive = true
        horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/CGFloat(self.count)).isActive = true
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":horizontalBarView]))
        
        let newTopView = UIView()
        horizontalBarView.addSubview(newTopView)
        newTopView.translatesAutoresizingMaskIntoConstraints = false
        newTopView.backgroundColor = UIColor(red: 252/255.0, green: 88/255.0, blue: 97/255.0, alpha: 1.0)
        horizontalBarView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":newTopView]))
        newTopView.widthAnchor.constraint(equalTo: horizontalBarView.widthAnchor, multiplier: self.widthRatio).isActive = true
        newTopView.centerXAnchor.constraint(equalTo: horizontalBarView.centerXAnchor).isActive = true
    }

}
