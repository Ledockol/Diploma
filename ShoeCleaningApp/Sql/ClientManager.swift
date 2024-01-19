//
//  ClientManager.swift
//  ShoeCleaningApp
//
//  Created by Андрей Беседин on 17.01.2024.
//

import Foundation
import SwiftUI
import Combine

class ClientManager: ObservableObject {
    @Published var customers: [Customer] = []
    @Published var employees: [Employee] = []
    @Published var swipedCustomers: Set<Customer> = Set()
    
    // Метод для сохранения данных о сотрудниках
    func saveEmployeesData() {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(employees) {
            UserDefaults.standard.set(encodedData, forKey: "employees")
        }
    }
    // Метод для сохранения данных о цветах
    func saveCellColors() {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(Array(swipedCustomers)) {
            UserDefaults.standard.set(encodedData, forKey: "cellColors")
        }
    }
    
    // Метод для загрузки данных о цветах
    func loadCellColors() {
        if let data = UserDefaults.standard.data(forKey: "cellColors") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode(Set<Customer>.self, from: data) {
                swipedCustomers = decodedData
            }
        }
    }
    
    //Удаление сотрудников
    func removeEmployee(_ employee: Employee) {
        if let index = employees.firstIndex(of: employee) {
            employees.remove(at: index)
            saveEmployeesData() 
            // Сохраняем обновленные данные после удаления
        }
    }
    
    // Метод для загрузки данных
    func loadEmployeesData() {
        if let data = UserDefaults.standard.data(forKey: "employees") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Employee].self, from: data) {
                employees = decodedData
            }
        }
    }
    
    
    // Метод для сохранения данных клиентов
    func saveCustomersData() {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(customers) {
            UserDefaults.standard.set(encodedData, forKey: "customers")
        }
    }
    // Удаление клиентов
    func removeCustomer(_ customer: Customer) {
        if let index = customers.firstIndex(of: customer) {
            customers.remove(at: index)
            saveCustomersData()
            // Сохраняем обновленные данные после удаления
        }
    }
    
    // Метод для загрузки данных клиентов
    func loadCustomersData() {
        if let data = UserDefaults.standard.data(forKey: "customers") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Customer].self, from: data) {
                customers = decodedData
            }
        }
    }
}
