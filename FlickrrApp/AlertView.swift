//
//  AlertView.swift
//  FlickrrApp
//
//  Created by Manikanta Sirumalla on 09/02/23.
//

import SwiftUI

struct AlertView: View {
    
    var error: Error
    
    var body: some View {
        VStack {
            Alert(title: , title: <#Text#>, message: <#T##Text?#>, dismissButton: <#T##Alert.Button?#>)
        }
    }
    
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(error: URLError.self as! Error )
    }
}
