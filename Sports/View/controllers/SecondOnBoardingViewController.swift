//
//  SecondOnBoardingViewController.swift
//  Sports
//
//  Created by Macos on 16/05/2025.
//

import UIKit

class SecondOnBoardingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func skip(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "HideOnBoarding")

        let secondViewController = (self.storyboard?.instantiateViewController(withIdentifier: "tab"))!

        secondViewController.navigationItem.hidesBackButton = true

        self.navigationController?.pushViewController(secondViewController, animated: true)
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
