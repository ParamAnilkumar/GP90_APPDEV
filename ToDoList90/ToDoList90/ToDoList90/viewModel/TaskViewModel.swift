import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = [
           Task(title: "Complete Xcode Project", description: "Implement all views and navigation", dueDate: Date()),
           Task(title: "Buy Groceries", description: "Get milk, eggs, and bread", dueDate: Date().addingTimeInterval(86400)),
           Task(title: "Finish Assignment", description: "Submit project before deadline", dueDate: Date().addingTimeInterval(172800))
       ]
    
    func addTask(_ task: Task) {
        tasks.append(task)
    }
    
    func updateTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = task
        }
    }
    
    func deleteTask(_ task: Task) {
        tasks.removeAll { $0.id == task.id }
    }
}
