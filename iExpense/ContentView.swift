//
//  ContentView.swift
//  iExpense
//
//  Created by Никита Мартьянов on 4.08.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    @StateObject var personalExpenses = Expenses()
    @StateObject var businessExpenses = Expenses()
    var body: some View {
        NavigationView {
            List {
                
                ForEach(expenses.items,id: \.id) { item in
                    HStack{
                        
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                            .foregroundColor(getTextColor(for: item.amount))


                    }
                }
                .onDelete(perform : removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar{
                Button {
                  showingAddExpense = true }
                label : {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    func getTextColor(for amount: Double) -> Color {
        if amount < 10 {
            return .green
        } else if amount < 100 {
            return .orange
        } else {
            return .red
        }
    }

        
        func removeItems(at offsets: IndexSet){
            expenses.items.remove(atOffsets: offsets)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

