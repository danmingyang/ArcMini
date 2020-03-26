//
//  VisitEditView.swift
//  Arc Mini
//
//  Created by Matt Greenfield on 22/3/20.
//  Copyright © 2020 Matt Greenfield. All rights reserved.
//

import SwiftUI
import LocoKit

struct VisitEditView: View {

    var visit: ArcVisit
    @ObservedObject var placeClassifier: PlaceClassifier

    init(visit: ArcVisit) {
        self.visit = visit
        self.placeClassifier = PlaceClassifier(visit: visit)!
        fetchPlaces()
    }

    var body: some View {
        List {
            ForEach(placeClassifier.results, id: \.place.placeId) { result in
                HStack {
                    Text(result.place.name)
                }
            }
        }
    }

    // MARK: - Search

    func fetchPlaces() {
        placeClassifier.fetchRemotePlaces(query: "").cauterize()
    }

}

//struct VisitEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        VisitEditView()
//    }
//}