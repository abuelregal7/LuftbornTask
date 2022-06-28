//
//  ViewController.swift
//  LuftbornTask
//
//  Created by Ahmed on 6/28/22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- Outlet properties
    
    @IBOutlet weak var taskTableViewOutlet: UITableView!
    
    @IBOutlet weak var containerViewOfTasksViewOutlet: UIView!
    @IBOutlet weak var containerViewOfTableViewOutlet: UIView!
    
    @IBOutlet weak var firstTaskViewOutlet: UIView!
    @IBOutlet weak var secondTaskViewOutlet: UIView!
    @IBOutlet weak var thirdTaskViewOutlet: UIView!
    @IBOutlet weak var fourthTaskViewOutlet: UIView!
    
    @IBOutlet weak var firstTaskLabelOutlet: UILabel!
    @IBOutlet weak var secondTaskLabelOutlet: UILabel!
    @IBOutlet weak var thirdTaskLabelOutlet: UILabel!
    @IBOutlet weak var fourthTaskLabelOutlet: UILabel!
    
    //MARK:- var & let properties
    
    let concurrentQueue = ConcurrentQueue()
    
    var tasks = [TasksModel]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.taskTableViewOutlet.reloadData()
                let indexPath = IndexPath(item: self.tasks.count - 1, section: 0)
                self.taskTableViewOutlet.scrollToRow(at: indexPath, at: .bottom, animated: true)
            }
        }
    }
    
    //MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        setUIConfiguration()
        
    }
    
    //MARK:- ConfigureTableView
    func configureTableView() {
        
        taskTableViewOutlet.delegate = self
        taskTableViewOutlet.dataSource = self
        
        let frame = CGRect(x: 0, y: 0, width: taskTableViewOutlet.frame.size.width, height: 1)
        taskTableViewOutlet.tableFooterView = UIView(frame: frame)
        taskTableViewOutlet.tableHeaderView = UIView(frame: frame)
        
    }
    
    //MARK:- SetUIConfiguration
    func setUIConfiguration() {
        
        [containerViewOfTableViewOutlet, containerViewOfTasksViewOutlet, firstTaskViewOutlet, secondTaskViewOutlet, thirdTaskViewOutlet, fourthTaskViewOutlet].forEach({
            $0?.layer.cornerRadius = 10
        })
        [containerViewOfTableViewOutlet, containerViewOfTasksViewOutlet].forEach({
            $0?.layer.borderWidth = 0.5
            $0?.layer.borderColor = UIColor.gray.cgColor
        })
        
        setupInitialTask()
        setFirstTaskViewOutletColor()
        
    }
    
    //MARK:- SetupInitialTask
    func setupInitialTask() {
        
        concurrentQueue.enqueueTask { [weak self] in
            guard let self = self else { return }
            
            let today = Date()
            self.tasks.append(TasksModel(StringDate: self.setDateFormatte(date: today), taskName: " Task 1"))
            print(self.tasks)
            
        }
        
        concurrentQueue.runAndRemoveAllTasks()
        
    }
    
    //MARK:- SetFirstTaskViewOutletColor
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
    
    //MARK:- SetSecondTaskViewOutletColor
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
    
    //MARK:- SetThirdTaskViewOutletColor
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
    
    //MARK:- SetFourthTaskViewOutletColor
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
    
    //MARK:- SetDateFormatte
    func setDateFormatte(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat =  "dd-MM-yyyy hh:mm:ss"
        print(formatter.string(from: date))
        return formatter.string(from: date)
    }
    
    //MARK:- FirstTaskButtonAction
    @IBAction func firstTaskButtonAction(_ sender: Any) {
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.setFirstTaskViewOutletColor()
        }
        
        concurrentQueue.enqueueTask { [weak self] in
            guard let self = self else { return }
            
            let today = Date()
            self.tasks.append(TasksModel(StringDate: self.setDateFormatte(date: today), taskName: " Task 1"))
            print(self.tasks)
            
        }
        
        concurrentQueue.runAndRemoveAllTasks()
        
    }
    
    //MARK:- SecondTaskButtonAction
    @IBAction func secondTaskButtonAction(_ sender: Any) {
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.setSecondTaskViewOutletColor()
        }
        
        concurrentQueue.enqueueTask { [weak self] in
            guard let self = self else { return }
            
            let today = Date()
            self.tasks.append(TasksModel(StringDate: self.setDateFormatte(date: today), taskName: " Task 2"))
            print(self.tasks)
            
        }
        
        concurrentQueue.runAndRemoveAllTasks()
        
    }
    
    //MARK:- ThirdTaskButtonAction
    @IBAction func thirdTaskButtonAction(_ sender: Any) {
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.setThirdTaskViewOutletColor()
        }
        
        concurrentQueue.enqueueTask { [weak self] in
            guard let self = self else { return }
            
            let today = Date()
            self.tasks.append(TasksModel(StringDate: self.setDateFormatte(date: today), taskName: " Task 3"))
            print(self.tasks)
            
        }
        
        concurrentQueue.runAndRemoveAllTasks()
        
    }
    
    //MARK:- FourthTaskButtonAction
    @IBAction func fourthTaskButtonAction(_ sender: Any) {
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.setFourthTaskViewOutletColor()
        }
        
        concurrentQueue.enqueueTask { [weak self] in
            guard let self = self else { return }
            
            let today = Date()
            self.tasks.append(TasksModel(StringDate: self.setDateFormatte(date: today), taskName: " Task 4"))
            print(self.tasks)
            
        }
        
        concurrentQueue.runAndRemoveAllTasks()
        
    }
    
    
}

//MARK:- extension from ViewController to inhert from UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = taskTableViewOutlet.dequeueReusableCell(withIdentifier: TasksTableViewCell.cellID, for: indexPath) as? TasksTableViewCell else { return UITableViewCell()}
        
        let item = tasks[indexPath.row]
        
        cell.configure(model: item)
        
        return cell
    }
    
}
