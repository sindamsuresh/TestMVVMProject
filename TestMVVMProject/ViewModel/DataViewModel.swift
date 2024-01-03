//
//  DataViewModel.swift
//  TestMVVMProject
//
//  Created by Suresh Sindam on 1/2/24.
//

import Foundation


class DataViewModel {
    
    var articlesData: DataModel?
    
    func fetchData(completion: @escaping () ->Void) {
        APIManager.shared.getData { [weak self] fetechedData in
            self?.articlesData = fetechedData
            completion()
        }
    }
    
    func noOfRows() -> Int {
        return articlesData?.articles.count ?? 0
    }
    
    func setRowAtIndex(index: Int) -> String {
        let articleTitle = articlesData?.articles[index]
        return articleTitle?.title ?? "error"
    }
    
    
    
}


