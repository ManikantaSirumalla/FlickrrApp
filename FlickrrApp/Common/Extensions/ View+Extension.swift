//
//  File.swift
//  FlickrrApp
//
//  Created by Manikanta Sirumalla on 09/02/23.
//

import SwiftUI

extension View {
    
   func showErrorAlert(title: LocalizedStringKey, error: Error) -> Alert {
      return Alert(title: Text(title),
             message: Text(LocalizedStringKey(error.localizedDescription)),
                   dismissButton: .default(Text(LocalizedStringKey("Okay"))))
    }
}
