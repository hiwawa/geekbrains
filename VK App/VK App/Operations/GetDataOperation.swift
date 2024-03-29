//
//  GetDataOperation.swift
//  VK App
//
//  Created by Aleksander Pankow on 24/08/2021.
//

import Foundation
import Alamofire

class AsyncOperation: Operation {
    enum State: String {
        case ready, executing, finished
        fileprivate var keyPath: String {
            return "is" + rawValue.capitalized
        }
    }
    
    var state = State.ready {
        willSet {
            willChangeValue(forKey: state.keyPath)
            willChangeValue(forKey: newValue.keyPath)
        }
        didSet {
            didChangeValue(forKey: state.keyPath)
            didChangeValue(forKey: oldValue.keyPath)
        }
    }

    override var isAsynchronous: Bool {
            return true
        }
        
        override var isReady: Bool {
            return super.isReady && state == .ready
        }
        
        override var isExecuting: Bool {
            return state == .executing
        }
        override var isFinished: Bool {
            return state == .finished
        }
        override func start() {
            if isCancelled {
                state = .finished
            } else {
                main()
                state = .executing
            }
        }
        override func cancel() {
            super.cancel()
            state = .finished
        }
    }
class GetDataOperation: AsyncOperation {

    override func cancel() {
        request.cancel()
        super.cancel()
    }
    
    private var request: DataRequest
    var data: Data?
    
    override func main() {
        request.responseData(queue: DispatchQueue.global()) { [weak self] response in
            self?.data = response.data
            self?.state = .finished
        }
    }
    
    init(request: DataRequest) {
        self.request = request
    }
    
}

