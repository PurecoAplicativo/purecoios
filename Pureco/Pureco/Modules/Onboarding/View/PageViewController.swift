//
//  PageViewController.swift
//  Pureco
//
//  Created by Giovani Pereira on 04/10/18.
//  Copyright © 2018 Pureco. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    var orderedViewControllers: [OnboardingViewController?] =
        [UIStoryboard(name: "Onboarding", bundle: nil).instantiateViewController(withIdentifier: "Init") as? OnboardingViewController,
         UIStoryboard(name: "Onboarding", bundle: nil).instantiateViewController(withIdentifier: "Notification") as? OnboardingViewController,
            UIStoryboard(name: "Onboarding", bundle: nil).instantiateViewController(withIdentifier: "Location") as? OnboardingViewController]

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        orderedViewControllers.forEach { $0?.delegate = self }
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController ?? UIViewController()], direction: .forward, animated: true, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let ovc = viewController as? OnboardingViewController else { return nil }
        guard let viewControllerIndex = orderedViewControllers.index(of: ovc) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return nil
        }
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let ovc = viewController as? OnboardingViewController else { return nil }
        guard let viewControllerIndex = orderedViewControllers.index(of: ovc) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
}

extension PageViewController: OnboardingViewNavigationDelegate {
    func didPressNext() {
        guard let currentViewController = self.viewControllers?.first else { return }
        guard let nextViewController = dataSource?.pageViewController( self, viewControllerAfter: currentViewController ) else {
            self.performSegue(withIdentifier: "loginSegue", sender: self)
            return
        }
        setViewControllers([nextViewController], direction: .forward, animated: false, completion: nil)
    }
}
