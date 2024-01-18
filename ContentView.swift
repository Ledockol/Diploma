// ContentView.swift
// ShoeCleaningApp
//
// Created by Андрей Беседин on 16.01.2024.
//
import SwiftUI

@main
struct YourApp: App {
    @StateObject private var clientManager = ClientManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(clientManager)
        }
    }
}

struct ContentView: View {
    @EnvironmentObject var clientManager: ClientManager

    var body: some View {
        NavigationView {
            VStack {
                Text("Химчистка обуви")
                    .font(.title)
                    .padding(.top, 50)

                Spacer()

                NavigationLink(destination: CustomersView(clientManager: clientManager)) {
                MenuButton(title: "Клиенты")
                }

                NavigationLink(destination: NewRecordView(clientManager: clientManager).environmentObject(clientManager)) {
                                    MenuButton(title: "Новая запись")
                                }
                NavigationLink(destination: EmployeesView(clientManager: clientManager)) {
                MenuButton(title: "Сотрудники")
                }

                NavigationLink(destination: MyScheduleView().environmentObject(clientManager)) {
                                MenuButton(title: "Расписание")
                            }

                Spacer()
            }
            .padding()
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct MenuButton: View {
    var title: String

    var body: some View {
        Text(title)
            .frame(width: 200, height: 50)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.bottom, 20)
    }
}
