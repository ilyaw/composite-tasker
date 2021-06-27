//
//  TaskTableViewController.swift
//  CompositeTasker
//
//  Created by Ilya on 27.06.2021.
//

import UIKit

class TaskTableViewController: UITableViewController {

    var task = Task(title: "Список дел")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = task.title
    
        tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskTableViewCell.reuseId)
        tableView.dataSource = self
        tableView.delegate = self
        
        let addTask = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddNewTask))
        navigationItem.rightBarButtonItem = addTask
    }
    
    @objc private func didTapAddNewTask() {
        self.showInputDialog(title: "Добавить новую задачу",
                             actionTitle: "Добавить",
                             cancelTitle: "Отменить",
                             inputPlaceholder: "Введите задачу",
                             inputKeyboardType: .alphabet, actionHandler: { taskTitle in
                                if let taskTitle = taskTitle {
                                    self.task.addTask(title: taskTitle)
                                    DispatchQueue.main.async {
                                        self.tableView.reloadData()
                                    }
                                }
                             })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return task.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.reuseId, for: indexPath) as? TaskTableViewCell else { return UITableViewCell() }
        
        let task = task.subTasks[indexPath.row]
        cell.setup(task)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            task.removeTask(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let taskTable = TaskTableViewController()
        
        if let task = task.subTasks[indexPath.row] as? Task {
            taskTable.task = task
            navigationController?.pushViewController(taskTable, animated: true)
        }
    }
}
