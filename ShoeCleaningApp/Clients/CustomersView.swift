//
// ClientsView.swift
// ShoeCleaningApp
//
// Created by Андрей Беседин on 16.01.2024.
//

import SwiftUI

struct CustomersView: View {
    @ObservedObject var clientManager: ClientManager
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var phone = ""
    
    var body: some View {
        VStack {
            Text("Клиенты")
                .font(.title)
                .padding()
            
            List {
                            ForEach(clientManager.customers) { customer in
                                HStack {
                                    Text("\(customer.firstName) \(customer.lastName), \(customer.phone)")
                                    Spacer()
                                    Button(action: {
                                        clientManager.removeCustomer(customer) // Вызываем метод удаления
                                    }) {
                                        Image(systemName: "trash")                        }
                    }
                }
            }

                            .padding()

                            Spacer()
                        }
                        .onAppear {
                            clientManager.loadCustomersData()
        }
    }
}
