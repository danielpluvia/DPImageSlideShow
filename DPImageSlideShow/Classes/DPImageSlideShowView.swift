//
//  DPImageSlideShowView.swift
//  DPImageSlideShow
//
//  Created by Xueqiang Ma on 25/6/18.
//

import UIKit

public class DPImageSlideShowView: UIView {
    
    // Index View Parameter
    var indexHeight: CGFloat = 2.1
    var indexWidthRatio: CGFloat = 0.3
    
    fileprivate var collectionView: DPImageSlideShowCollectionView = DPImageSlideShowCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    fileprivate var indexView: DPImageSlideShowIndexView = DPImageSlideShowIndexView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

extension DPImageSlideShowView {
    
    public func setup(views: [UIView]) {
        self.collectionView.myDataSource.contents = views
        self.collectionView.myPresenter.indexView = self.indexView
        self.collectionView.myPresenter.widthRatio = self.indexWidthRatio

        self.indexView.count = self.collectionView.myDataSource.contents.count
        self.indexView.setup()
        
        // Constraints
        self.addSubview(self.collectionView)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":self.collectionView]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":self.collectionView]))
        
        self.addSubview(self.indexView)
        self.indexView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: self.indexWidthRatio).isActive = true
        self.indexView.heightAnchor.constraint(equalToConstant: self.indexHeight).isActive = true
        self.indexView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.indexView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
    }
    
}
