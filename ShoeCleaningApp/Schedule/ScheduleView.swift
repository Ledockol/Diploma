//
// MyScheduleView.swift
// ShoeCleaningApp
//
// Created by Андрей Беседин on 16.01.2024.
//

import SwiftUI


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
                            
                            toggleCellColor(for: customer)
                        } label: {
                            Label("Изменить цвет", systemImage: "paintbrush.fill")
                        }
                        .tint(.green)
                    }
                }
            }
        }
        .onAppear {
            
            
            clientManager.loadCellColors()
        }
    }
    
    private func cellColor(for customer: Customer) -> Color {
        return clientManager.swipedCustomers.contains(customer) ? Color.green : Color.clear
    }
    
    private func toggleCellColor(for customer: Customer) {
        if clientManager.swipedCustomers.contains(customer) {
            clientManager.swipedCustomers.remove(customer)
        } else {
            clientManager.swipedCustomers.insert(customer)
        }
        clientManager.saveCellColors()
    }
}
