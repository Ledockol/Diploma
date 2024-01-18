//
//  NewRecordView.swift
//  ShoeCleaningApp
//
//  Created by Андрей Беседин on 16.01.2024.
//

import SwiftUI

struct NewRecordView: View {
    @ObservedObject var clientManager: ClientManager
    @State private var customerFirstName = ""
    @State private var customerLastName = ""
    @State private var customerPhone = ""
    @State private var customerService = ""
    @State private var customerServices: [String] = []

    var body: some View {
        VStack {
            Text("Новая запись")
                .font(.title)
                .padding()

            // Форма для добавления нового клиента
            VStack {
                TextField("Имя клиента", text: $customerFirstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Фамилия клиента", text: $customerLastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Телефон клиента", text: $customerPhone)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                HStack {
                    TextField("Услуга", text: $customerService)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button(action: {
                        if !self.customerService.isEmpty {
                            self.customerServices.append(self.customerService)
                            self.customerService = ""
                        }
                    }) {
                        Text("Добавить услугу")
                    }
                }

                // Отображение введенных услуг
                if !customerServices.isEmpty {
                    Text("Услуги:")
                    ForEach(customerServices, id: \.self) { service in
                        Text("- \(service)")
                    }
                }
            }
            .padding()

            Button(action: {
                let newCustomer = Customer(firstName: customerFirstName,
                                           lastName: customerLastName,
                                           phone: customerPhone,
                                           services: customerServices) // Используйте массив услуг

                clientManager.customers.append(newCustomer)
                clientManager.saveCustomersData()

                // Сброс введенных данных
                customerFirstName = ""
                customerLastName = ""
                customerPhone = ""
                customerService = ""
                customerServices = []
            }) {
                Text("Добавить клиента")
            }
        }
    }
}
