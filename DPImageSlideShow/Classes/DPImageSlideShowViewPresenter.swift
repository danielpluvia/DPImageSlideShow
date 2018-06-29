//
//  DPImageSlideShowViewPresenter.swift
//  DPImageSlideShow
//
//  Created by Xueqiang Ma on 23/6/18.
//

import UIKit

class DPImageSlideShowViewPresenter: NSObject {
    weak var indexView: DPImageSlideShowIndexView?
    var widthRatio: CGFloat = 0.3
}

extension DPImageSlideShowViewPresenter: UICollectionViewDelegate {
    
}

extension DPImageSlideShowViewPresenter: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let indexView = self.indexView {
            indexView.horizontalBarViewLeftAnchor?.constant = scrollView.contentOffset.x / CGFloat(indexView.count) * self.widthRatio
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        let index = targetContentOffset.pointee.x / scrollView.frame.width
//        self.pageMenuBarView?.collectionView.selectItem(at: IndexPath(item: Int(index), section: 0), animated: true, scrollPosition: UICollectionViewScrollPosition.init(rawValue: 0))
    }
    
}
