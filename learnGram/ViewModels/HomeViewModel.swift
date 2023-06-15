//
//  HomeViewModel.swift
//  learnGram
//
//  Created by Yousuf on 5/6/23.
//

import Foundation

class HomeViewModel {
    
    private let unsplashService = UnsplashService()
    var feedItems : [FeedItemData] = []
    
    func getPhotos(callback : @escaping (Bool) -> Void) {
        unsplashService.getPhotos() { searchResponnse in
            self.feedItems.removeAll()
            if(searchResponnse.results.isEmpty) {
                callback(false)
            } else {
                for photoItem in searchResponnse.results {
                    //print("Item: \(photoItem)")
                    let photoDescription = photoItem.description ?? photoItem.alt_description ?? "not found"
                    self.feedItems.append(
                        FeedItemData(
                            description: photoDescription,
                            url: URL(string: photoItem.urls.small) ?? URL(fileURLWithPath: "mosque")
                        )
                    )
                }
                callback(true)
            }

        }
    }
    
}
