//
//  HostingController.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 15/03/2022.
//

import SwiftUI

class HostingController: UIHostingController<AnyView> {

    @objc required dynamic init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: AnyView(EmptyView()))
    }
}
