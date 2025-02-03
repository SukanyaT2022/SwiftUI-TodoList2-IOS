//
//  ViewController.swift
//  Feb2TableViewCellPractice
//
//  Created by Tiparpron Sukanya on 2/2/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    @IBOutlet weak var firstScreenTableView: UITableView!
    
//    struct Student{
//        let studentName: String
//            let studentImage: String
//    }
//    let data: [Student] = [
//        Student(studentName:"dido", studentImage:"s1"),
//       Student(studentName:"kitty", studentImage:"s2"),
//        Student(studentName:"mummy", studentImage:"s3"),
//        Student(studentName:"kara", studentImage:"s4"),
//        Student(studentName:"paepae", studentImage:"s5")
//        ]
    
    let studentName = ["dido", "kitty", "mummy", "kara", "paepae"]
    let studentImage = ["s1", "s2", "s3", "s4", "s5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstScreenTableView.delegate = self
        firstScreenTableView.dataSource = self
    }


}
extension ViewController{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "SecondScreenUIViewController") as! SecondScreenUIViewController
        detailVC.holdStudentName = studentName[indexPath.row]
        detailVC.holdStudentImage = UIImage(named: studentImage[indexPath.row])
        
       // line below connect or push viewcontrollr with SecondScreenUIViewController
        navigationController?.pushViewController(detailVC, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return studentName.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //deque means insert or remove
     let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as!
        CustomTableViewCell
        cell.nameLabel.text = studentName[indexPath.row]
        cell.studentImageView.image = UIImage(named: studentImage[indexPath.row])
        return cell
    }
    
}
