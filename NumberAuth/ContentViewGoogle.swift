//
//  ContentViewGoogle.swift
//  NumberAuth
//
//  Created by Jannatun Nahar Papia on 5/10/22.
//

import SwiftUI

struct  ContentViewGoogle: View {
  @EnvironmentObject var viewModel: AuthenticationViewModel
  
  var body: some View {
    switch viewModel.state {
      case .signedIn: HomeView()
      case .signedOut: LoginView()
    }
  }
}


//struct ContentViewGoogle: View {
//    var body: some View {
//        logingoogle()
//    }
//}

//struct ContentViewGoogle_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentViewGoogle()
//    }
//}
