//
//  PageViewController.swift
//  Sports
//
//  Created by Macos on 15/05/2025.
//

import UIKit

class PageViewController: UIPageViewController , UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    
    
    
    var screensArr = [UIViewController]()
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = screensArr.firstIndex(of: viewController)else{
            return nil
        }
        let prevIndex = currentIndex - 1
        guard prevIndex >= 0 else{
            //return screensArr.last
            return nil
        }
        return screensArr[prevIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = screensArr.firstIndex(of: viewController)else{
            return nil
        }
        let nextIndex = currentIndex + 1
        guard nextIndex < screensArr.count else{
           // return screensArr.first
            return nil
        }
        return screensArr[nextIndex]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        let v1 = self.storyboard?.instantiateViewController(withIdentifier: "v1")
        let v2 = self.storyboard?.instantiateViewController(withIdentifier: "v2")
        let v3 = self.storyboard?.instantiateViewController(withIdentifier: "v3")
        screensArr.append(v1!)
        screensArr.append(v2!)
        screensArr.append(v3!)
        delegate = self
        dataSource = self
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.systemBlue
        if let v1 = screensArr.first{
            setViewControllers([v1], direction: .forward, animated: true , completion: nil)
        }
        // Do any additional setup after loading the view.
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return screensArr.count
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
