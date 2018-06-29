//
//  DPImageSlideShowViewDatasource.swift
//  DPImageSlideShow
//
//  Created by Xueqiang Ma on 23/6/18.
//

import UIKit

class DPImageSlideShowViewDatasource: NSObject {
    
    let cellID = "CellID"
    var contents: [UIView] = []
    
}

extension DPImageSlideShowViewDatasource: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.contents.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellID, for: indexPath)

        let newView = contents[indexPath.item]
        newView.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(newView)
        cell.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":newView]))
        cell.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":newView]))
        
        return cell
    }
    
}
