//
//  ViewController.swift
//  Feb2TableViewCellPractice
//
//  Created by Tiparpron Sukanya on 2/2/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {


    @IBOutlet weak var firstScreenTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
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
    
//    let studentName = ["dido", "kitty", "mummy", "kara", "paepae"]
//    let studentImage = ["s1", "s2", "s3", "s4", "s5"]
    
    
    
    struct Student{
        let studentName: String
        let studentAge: Int
        let studentImage: String
    }
    
    
   var data:[Student] = [
        Student(studentName: "dido", studentAge: 25, studentImage: "s1"),
        Student(studentName: "kitty", studentAge: 24, studentImage: "s2"),
        Student(studentName: "mummy", studentAge: 20, studentImage:"s3"),
        Student(studentName: "kara", studentAge: 22, studentImage:"s4"),
        Student(studentName: "paepae", studentAge: 25, studentImage: "s5"),
   
        ]
    var originalData:[Student] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.backgroundImage = UIImage()// make search bar background  empty
        firstScreenTableView.delegate = self
        firstScreenTableView.dataSource = self
        self.searchBar.delegate = self
        originalData = data
    }
    


}
extension ViewController{
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let detailVC = storyboard.instantiateViewController(withIdentifier: "SecondScreenUIViewController") as! SecondScreenUIViewController
//        detailVC.holdStudentName = studentName[indexPath.row]
//        detailVC.holdStudentImage = UIImage(named: studentImage[indexPath.row])
//        
//       // line below connect or push viewcontrollr with SecondScreenUIViewController
//        navigationController?.pushViewController(detailVC, animated: true)
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return studentName.count
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        150
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        //deque means insert or remove
//     let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as!
//        CustomTableViewCell
//        cell.nameLabel.text = studentName[indexPath.row]
//        cell.studentImageView.image = UIImage(named: studentImage[indexPath.row])
//        return cell
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    func tableView(_ tableView: UITableView, cellForRowAt
                   indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellId", for: indexPath) as! CustomTableViewCell
        let student = data[indexPath.row]
        cell.studentImageView.image = UIImage(named:student.studentImage)
        
        cell.nameLabel.text = student.studentName + " " + "\(student.studentAge)"
        // the way to change age from int to string
        return cell
        
    }
    
//    next step -- type didselectrow to call for function> then type let story board and hit tab> chnage "" to secondscreenviewcontroller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondScreenUIViewController") as! SecondScreenUIViewController
        
        let student = data[indexPath.row]
        
        vc.holdStudentName = student.studentName + " " + "\(student.studentAge)"
        
        vc.holdStudentImage =
        UIImage(named:student.studentImage)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
//    search bar code below
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
       return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       print("search text is \(searchText)")
        if searchText.isEmpty {
            data = originalData
            self.firstScreenTableView.reloadData()
            return
        }else{
            data = data.filter { $0.studentName.lowercased().contains(searchText.lowercased()) }
            self.firstScreenTableView.reloadData()
        }
        
        
    }
}
