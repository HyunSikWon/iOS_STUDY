//
//  ViewController.swift
//  ScrollingFrom-Challenge
//
//  Created by 원현식 on 2020/01/03.
//  Copyright © 2020 Hyunsik Won. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var pageControl: UIPageControl!
}

extension ViewController: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let pageWidth = scrollView.bounds.width
    pageControl.currentPage = Int(scrollView.contentOffset.x / pageWidth)
  }
}

