import SwiftUI

// MARK: - MainView
struct MainView: View {
    @StateObject private var viewModel = TaskViewModel()
    @State private var showingAddTask = false
    
    let colors: [Color] = [.cyan, .teal, .indigo, .mint, .brown, .gray, .yellow]
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(.systemGray6), Color(.systemGray5)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    List {
                        ForEach(viewModel.tasks.indices, id: \ .self) { index in
                            let task = viewModel.tasks[index]
                            NavigationLink(destination: TaskDetailView(task: task, viewModel: viewModel)) {
                                HStack {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(task.title)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        Text(task.dueDate, style: .date)
                                            .font(.subheadline)
                                            .foregroundColor(.white.opacity(0.8))
                                    }
                                    Spacer()
                                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                        .foregroundColor(task.isCompleted ? .green : .white.opacity(0.8))
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(colors[index % colors.count]).shadow(radius: 3))
                            }
                        }
                        .onDelete { indexSet in
                            indexSet.map { viewModel.tasks[$0] }.forEach(viewModel.deleteTask)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: { showingAddTask = true }) {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .padding()
                                .background(Color.white.opacity(0.8))
                                .foregroundColor(.blue)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("🎯To-Do List")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .sheet(isPresented: $showingAddTask) {
                AddTaskView(viewModel: viewModel)
            }
        }
    }
}
