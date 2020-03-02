//
//  AboutViewController.swift
//  Simple Clicker Game
//
//  Created by Gevorg Avagyan on 12/4/19.
//  Copyright © 2019 Ruslan Tereshchenko. All rights reserved.
//

import UIKit

class AboutVC: UIPageViewController, UIPageViewControllerDataSource {
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
         return [self.newColoredViewController(color: "first"),
                 self.newColoredViewController(color: "second"),
                 self.newColoredViewController(color: "third"),
                 self.newColoredViewController(color: "fourth")]
     }()
    
    var currentIndex:Int {
             get {
                return orderedViewControllers.firstIndex(of: self.viewControllers!.first!)!
             }

             set {
                 guard newValue >= 0,
                     newValue < orderedViewControllers.count else {
                     return
                 }

                 let vc = orderedViewControllers[newValue]
                let direction:UIPageViewController.NavigationDirection = newValue > currentIndex ? .forward : .reverse
                 self.setViewControllers([vc], direction: direction, animated: true, completion: nil)
             }
         }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
    }
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
         let previousIndex = currentIndex - 1

              guard previousIndex >= 0 else {
                  return nil
              }

              guard orderedViewControllers.count > previousIndex else {
                  return nil
              }

              return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            let nextIndex = currentIndex + 1

            guard orderedViewControllers.count != nextIndex else {
                return nil
            }

            guard orderedViewControllers.count > nextIndex else {
                return nil
            }

            return orderedViewControllers[nextIndex]
    }
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
           return orderedViewControllers.count
       }

       func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {

           return currentIndex
       }
    
    
 
    
    private func newColoredViewController(color: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "\(color)VC")
    }
    
    
}
