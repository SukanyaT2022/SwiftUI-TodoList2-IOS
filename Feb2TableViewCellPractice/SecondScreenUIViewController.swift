//
//  SecondScreenUIViewController.swift
//  Feb2TableViewCellPractice
//
//  Created by Tiparpron Sukanya on 2/3/25.
//

import UIKit

class SecondScreenUIViewController: UIViewController {
    
    @IBOutlet weak var secondScreenImageView: UIImageView!
    
    @IBOutlet weak var secondScreenNameLabel: UILabel!
    
    var holdStudentImage: UIImage!
    var holdStudentName: String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.secondScreenImageView.image = self.holdStudentImage
        self.secondScreenNameLabel.text = self.holdStudentName

        // Do any additional setup after loading the view.
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
