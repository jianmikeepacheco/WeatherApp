//
//  AddLocationView.swift
//  Weatherly
//
//  Created by jian.mikee.pacheco on 9/8/22.
// 

import SwiftUI
import CoreData

struct AddLocationView: View {
    // MARK: - PROPERTY
    
    @State var startCity = Constants.Strings.city
    @EnvironmentObject var dataStore: DataStore
    
    @ObservedObject var addLocationVM = AddLocationVM()
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var locationList: [String] = []
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack {
                VStack (spacing: 0) {
                    // MARK: - TITLE
                    HStack {
                        Text("Location List")
                            .foregroundColor(Color("TextColor"))
                            .fontWeight(.bold)
                            .font(.title)
                        
                        Spacer().frame(width: 150)
                    }.padding(.horizontal)
                    
                    // MARK: - SEARCHBAR
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color("ConcCircleColor"))
                            .frame(width: 350, height: 55)
                        
                        HStack {
                            Spacer()
                            Image(systemName: "location.magnifyingglass")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                                .padding()
                            
                            Spacer()
                            TextField("Search", text: $startCity)
                                .padding(.leading, 10)
                                .font(.title)
                            
                            Spacer()
                        }
                    }
                    .foregroundColor(Color("TextColor"))
                    .padding(.horizontal)
                    
                    // MARK: - LOCATION LIST
                    
                    List {
                        ForEach(locationList, id: \.self) { location in
                            NavigationLink {
                                HomeScreenView()
                            }
                        label: { LocationList(locationName: location)
                        }.listRowBackground(Color.clear)
                        }
                    }.listStyle(PlainListStyle()).padding(.horizontal)
                    
                }
                .padding(.horizontal)
                
            }
            // MARK: - NAVIGATION ITEMS
            .navigationBarItems(leading: Button(action: {}, label: {
                NavigationLink(destination: HomeScreenView())
                {
                    TopNavBar(title: "Back").padding()
                }
            })
            )
            
            .navigationBarItems(trailing: Button( action: {
                Constants.Strings.city = startCity
                locationList.append(startCity)
                //updateSaveButton
                
            }) {
                TopNavBar(title: "Add").padding()
            })
            
            //.navigationBarItems(trailing: updateSaveButton)
            
            .background(
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
            )
            
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .navigationBarHidden(true)
        
    }
    
}

extension AddLocationView {
    func updateToDo() {
        let loc = AddLocation(id: addLocationVM.id!, location: addLocationVM.location)
        dataStore.updateLocation(loc)
        presentationMode.wrappedValue.dismiss()
    }
    
    func addToDo() {
        let loc = AddLocation(location: addLocationVM.location)
        dataStore.addLocation(loc)
        presentationMode.wrappedValue.dismiss()
    }
    
    var cancelButton: some View {
        Button("Cancel") {
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    var updateSaveButton: some View {
        Button( addLocationVM.updating ? "Update" : "Save",
                action: addLocationVM.updating ? updateToDo : addToDo)
        .disabled(addLocationVM.isDisabled)
    }
}


// MARK: - PREVIEW
struct AddLocationView_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationView().environmentObject(Store())
    }
}


