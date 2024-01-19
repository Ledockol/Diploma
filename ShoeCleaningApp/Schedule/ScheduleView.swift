//
// MyScheduleView.swift
// ShoeCleaningApp
//
// Created by Андрей Беседин on 16.01.2024.
//

import SwiftUI

//struct MyScheduleView: View {
//    @EnvironmentObject var clientManager: ClientManager
//    @State private var swipedCustomer: Customer?
//
//    var body: some View {
//        VStack {
//            Text("Расписание")
//                .font(.title)
//                .padding()
//
//            // Используйте данные о клиентах из clientManager.customers
//            List {
//                            ForEach(clientManager.customers) { customer in
//                                // Отображение данных о телефоне и услугах клиента в расписании
//                                VStack(alignment: .leading) {
//                                    Text("Номер заказа: \(customer.phone)")
//                                    Text("Услуги: \(customer.services.joined(separator: ", "))")
//                                        .foregroundColor(.gray)
//                                }
//                                .listRowBackground(swipedCustomer == customer ? Color.green : Color.clear) // Изменяем цвет фона ячейки при свайпе
//                                .swipeActions {
//                                    Button {
//                                        // Выполните действия, которые вы хотите выполнить при свайпе
//                                        // Например, измените цвет ячейки
//                                        swipedCustomer = customer
//                                    } label: {
//                                        Label("Изменить цвет", systemImage: "paintbrush.fill")
//                                    }
//                                    .tint(.green) // Цвет кнопки свайпа
//                                }
//                            }
//                        }
//                    }
//                }
//            }
struct MyScheduleView: View {
    @EnvironmentObject var clientManager: ClientManager
    @State private var swipedCustomers: Set<Customer> = Set()

    var body: some View {
        VStack {
            Text("Расписание")
                .font(.title)
                .padding()

            List {
                ForEach(clientManager.customers.indices, id: \.self) { index in
                    let customer = clientManager.customers[index]

                    VStack(alignment: .leading) {
                        Text("Номер заказа: \(customer.phone)")
                        Text("Услуги: \(customer.services.joined(separator: ", "))")
                            .foregroundColor(.gray)
                    }
                    .listRowBackground(cellColor(for: customer))
                    .swipeActions {
                        Button {
                            // Выполняем действия при свайпе, например, изменяем цвет
                            toggleCellColor(for: customer)
                        } label: {
                            Label("Изменить цвет", systemImage: "paintbrush.fill")
                        }
                        .tint(.green) // Цвет кнопки свайпа
                    }
                }
            }
        }
        .onAppear {
            
            // Загружаем сохраненные цвета при появлении представления
            clientManager.loadCellColors()
        }
    }

    // Метод для определения цвета ячейки
    private func cellColor(for customer: Customer) -> Color {
        return clientManager.swipedCustomers.contains(customer) ? Color.green : Color.clear
    }

    // Метод для изменения цвета ячейки при свайпе
    private func toggleCellColor(for customer: Customer) {
        if clientManager.swipedCustomers.contains(customer) {
            clientManager.swipedCustomers.remove(customer)
        } else {
            clientManager.swipedCustomers.insert(customer)
        }

        // Сохраняем обновленные данные о цветах в UserDefaults
        clientManager.saveCellColors()
    }
}
