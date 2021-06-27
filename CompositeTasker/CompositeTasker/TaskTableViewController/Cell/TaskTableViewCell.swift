//
//  TaskTableViewCell.swift
//  CompositeTasker
//
//  Created by Ilya on 27.06.2021.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    static let reuseId = "TaskTableViewCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStackView() {
        addSubview(stackView)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subTitleLabel)
        
        let inset: CGFloat = 10

        stackView.anchor(top: safeAreaLayoutGuide.topAnchor,
                         leading: safeAreaLayoutGuide.leadingAnchor,
                         bottom: nil,
                         trailing: safeAreaLayoutGuide.trailingAnchor,
                         padding: UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset))
//        stackView
//        stackView
//        stackView
//        stackView
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(_ taskModel: TaskProtocol) {
        titleLabel.text = taskModel.title
        subTitleLabel.text = "Подзадач: \(taskModel.subTasks.count)"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = nil
        subTitleLabel.text = nil
    }
    
    
}
