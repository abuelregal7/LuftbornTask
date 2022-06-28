//
//  ViewController.swift
//  LuftbornTask
//
//  Created by Ahmed on 6/28/22.
//

import UIKit

struct TasksModel {
    let StringDate: String?
    let taskName: String?
}

class ViewController: UIViewController {
    
    @IBOutlet weak var taskTableViewOutlet: UITableView!
    
    @IBOutlet weak var containerViewOfTasksViewOutlet: UIView!
    
    @IBOutlet weak var firstTaskViewOutlet: UIView!
    @IBOutlet weak var secondTaskViewOutlet: UIView!
    @IBOutlet weak var thirdTaskViewOutlet: UIView!
    @IBOutlet weak var fourthTaskViewOutlet: UIView!
    
    @IBOutlet weak var firstTaskLabelOutlet: UILabel!
    @IBOutlet weak var secondTaskLabelOutlet: UILabel!
    @IBOutlet weak var thirdTaskLabelOutlet: UILabel!
    @IBOutlet weak var fourthTaskLabelOutlet: UILabel!
    
    let concurrentQueue = ConcurrentQueue()
    
//    var tasks = [String]() {
//        didSet {
//            DispatchQueue.main.async { [weak self] in
//                guard let self = self else { return }
//                self.taskTableViewOutlet.reloadData()
//            }
//        }
//    }
    
    var tasks = [TasksModel]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.taskTableViewOutlet.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskTableViewOutlet.delegate = self
        taskTableViewOutlet.dataSource = self
        
        [containerViewOfTasksViewOutlet, firstTaskViewOutlet, secondTaskViewOutlet, thirdTaskViewOutlet, fourthTaskViewOutlet].forEach({
            $0?.layer.cornerRadius = 10
        })
        containerViewOfTasksViewOutlet.layer.borderWidth = 0.5
        containerViewOfTasksViewOutlet.layer.borderColor = UIColor.gray.cgColor
        
//        concurrentQueue.enqueueTask {
//
//            print("1")
//            print(Date())
//            let today = Date()
//            let formatter = DateFormatter()
//            formatter.dateFormat =  "dd-MM-yyyy hh:mm"
//            print(formatter.string(from: today))
//            self.tasks.append(formatter.string(from: today) + " Task 4")
//            print(self.tasks)
//
//        }
//
//        concurrentQueue.enqueueTask {
//
//            print("2")
//            print(Date())
//            let today = Date()
//            let formatter = DateFormatter()
//            formatter.dateFormat =  "dd-MM-yyyy hh:mm"
//            print(formatter.string(from: today))
//            self.tasks.append(formatter.string(from: today) + " Task 2")
//            print(self.tasks)
//
//        }
//
//        concurrentQueue.enqueueTask {
//
//            print("3")
//            print(Date())
//            let today = Date()
//            let formatter = DateFormatter()
//            formatter.dateFormat =  "dd-MM-yyyy hh:mm"
//            print(formatter.string(from: today))
//            self.tasks.append(formatter.string(from: today) + " Task 1")
//            print(self.tasks)
//
//        }
//
//        concurrentQueue.runAndRemoveAllTasks()
        
        setFirstTaskViewOutletColor()
        
    }
    
    func setFirstTaskViewOutletColor() {
        
        firstTaskViewOutlet.backgroundColor = .black
        secondTaskViewOutlet.backgroundColor = .white
        thirdTaskViewOutlet.backgroundColor = .white
        fourthTaskViewOutlet.backgroundColor = .white
        
        firstTaskLabelOutlet.textColor = .white
        secondTaskLabelOutlet.textColor = .black
        thirdTaskLabelOutlet.textColor = .black
        fourthTaskLabelOutlet.textColor = .black
    }
    
    func setSecondTaskViewOutletColor() {
        
        firstTaskViewOutlet.backgroundColor = .white
        secondTaskViewOutlet.backgroundColor = .black
        thirdTaskViewOutlet.backgroundColor = .white
        fourthTaskViewOutlet.backgroundColor = .white
        
        firstTaskLabelOutlet.textColor = .black
        secondTaskLabelOutlet.textColor = .white
        thirdTaskLabelOutlet.textColor = .black
        fourthTaskLabelOutlet.textColor = .black
        
    }
    
    func setThirdTaskViewOutletColor() {
        
        firstTaskViewOutlet.backgroundColor = .white
        secondTaskViewOutlet.backgroundColor = .white
        thirdTaskViewOutlet.backgroundColor = .black
        fourthTaskViewOutlet.backgroundColor = .white
        
        firstTaskLabelOutlet.textColor = .black
        secondTaskLabelOutlet.textColor = .black
        thirdTaskLabelOutlet.textColor = .white
        fourthTaskLabelOutlet.textColor = .black
        
    }
    
    func setFourthTaskViewOutletColor() {
        
        firstTaskViewOutlet.backgroundColor = .white
        secondTaskViewOutlet.backgroundColor = .white
        thirdTaskViewOutlet.backgroundColor = .white
        fourthTaskViewOutlet.backgroundColor = .black
        
        firstTaskLabelOutlet.textColor = .black
        secondTaskLabelOutlet.textColor = .black
        thirdTaskLabelOutlet.textColor = .black
        fourthTaskLabelOutlet.textColor = .white
        
    }
    
    @IBAction func firstTaskButtonAction(_ sender: Any) {
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.setFirstTaskViewOutletColor()
        }
        
        concurrentQueue.enqueueTask {
            
            let today = Date()
            let formatter = DateFormatter()
            formatter.dateFormat =  "dd-MM-yyyy hh:mm"
            print(formatter.string(from: today))
            //self.tasks.append(formatter.string(from: today) + " Task 1")
            self.tasks.append(TasksModel(StringDate: formatter.string(from: today), taskName: " Task 1"))
            print(self.tasks)
            
        }
        
        concurrentQueue.runAndRemoveAllTasks()
        
    }
    
    @IBAction func secondTaskButtonAction(_ sender: Any) {
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.setSecondTaskViewOutletColor()
        }
        
        concurrentQueue.enqueueTask {
            
            let today = Date()
            let formatter = DateFormatter()
            formatter.dateFormat =  "dd-MM-yyyy hh:mm"
            print(formatter.string(from: today))
            self.tasks.append(TasksModel(StringDate: formatter.string(from: today), taskName: " Task 2"))
            print(self.tasks)
            
        }
        
        concurrentQueue.runAndRemoveAllTasks()
        
    }
    
    @IBAction func thirdTaskButtonAction(_ sender: Any) {
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.setThirdTaskViewOutletColor()
        }
        
        concurrentQueue.enqueueTask {
            
            let today = Date()
            let formatter = DateFormatter()
            formatter.dateFormat =  "dd-MM-yyyy hh:mm"
            print(formatter.string(from: today))
            self.tasks.append(TasksModel(StringDate: formatter.string(from: today), taskName: " Task 3"))
            print(self.tasks)
            
        }
        
        concurrentQueue.runAndRemoveAllTasks()
        
    }
    
    @IBAction func fourthTaskButtonAction(_ sender: Any) {
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.setFourthTaskViewOutletColor()
        }
        
        concurrentQueue.enqueueTask {
            
            let today = Date()
            let formatter = DateFormatter()
            formatter.dateFormat =  "dd-MM-yyyy hh:mm"
            print(formatter.string(from: today))
            self.tasks.append(TasksModel(StringDate: formatter.string(from: today), taskName: " Task 4"))
            print(self.tasks)
            
        }
        
        concurrentQueue.runAndRemoveAllTasks()
        
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskTableViewOutlet.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row].StringDate
        
        return cell
    }
    
}

//            DispatchQueue.main.asyncAfter(deadline: .now() + 60) { [weak self] in
//
//                // your code here
//                guard let self = self else { return }
//
//                print(Date())
//
//            }
