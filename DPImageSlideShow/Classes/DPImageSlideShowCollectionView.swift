//
//  DPImageSlideShowView.swift
//  DPImageSlideShow
//
//  Created by Xueqiang Ma on 23/6/18.
//

import UIKit

class DPImageSlideShowCollectionView: UICollectionView {
    
    let myPresenter = DPImageSlideShowViewPresenter()
    let myDataSource = DPImageSlideShowViewDatasource()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
}

extension DPImageSlideShowCollectionView {
    
    func setContent(contents: [UIView]) {
        self.myDataSource.contents = contents
    }
    
    fileprivate func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setupCollectionView()
    }
    
    fileprivate func setupCollectionView() -> Void {
        self.register(UICollectionViewCell.self, forCellWithReuseIdentifier: self.myDataSource.cellID)
        self.delegate = self.myPresenter
        self.dataSource = self.myDataSource
        // Paging Scroll
        self.isPagingEnabled = true
        if let flowLayout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
        // Hide Scroll Indicators
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
    }
  
}
