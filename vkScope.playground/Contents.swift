import UIKit

struct VKScopeBitmask: OptionSet{
    let rawValue: Int
    
    static let friends = VKScopeBitmask(rawValue: 1<<1)
    static let photos = VKScopeBitmask(rawValue: 1<<2)
    static let status = VKScopeBitmask(rawValue: 1<<10)
    static let groups = VKScopeBitmask(rawValue: 1<<18)
    static let wall = VKScopeBitmask(rawValue: 1<<13)
    static let offline = VKScopeBitmask(rawValue: 1<<16)
    
    static let all: VKScopeBitmask = [.friends, .photos, .status, .groups, .wall, .offline]
    
}

let scope = VKScopeBitmask.all

print(scope.rawValue)
