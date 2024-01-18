//
//  EmployeesView.swift
//  ShoeCleaningApp
//
//  Created by Андрей Беседин on 17.01.2024.
//


import SwiftUI

struct EmployeesView: View {
    @ObservedObject var clientManager: ClientManager
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var position = ""

    var body: some View {
        VStack {
            Text("Сотрудники")
                .font(.title)
                .padding()

            List {
                            ForEach(clientManager.employees) { employee in
                                HStack {
                                    Text("\(employee.firstName) \(employee.lastName), \(employee.position)")
                                    Spacer()
                                    Button(action: {
                                        clientManager.removeEmployee(employee) // Вызываем метод удаления
                                    }) {
                                        Image(systemName: "trash")
                        }
                    }
                }
            }

            // Форма для добавления нового сотрудника
            HStack {
                TextField("Имя", text: $firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Фамилия", text: $lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Должность", text: $position)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: {
                                    let newEmployee = Employee(firstName: firstName, lastName: lastName, position: position)
                                    clientManager.employees.append(newEmployee)
                                    clientManager.saveEmployeesData() // Сохраняем данные при добавлении сотрудника
                                    firstName = ""
                                    lastName = ""
                                    position = ""
                                }) {
                                    Text("Добавить")
                                }
                            }
                            .padding()

                            Spacer()
                        }
                        .onAppear {
                            clientManager.loadEmployeesData()
        }
    }
}
