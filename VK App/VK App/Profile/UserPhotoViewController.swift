//
//  UserPhotoViewController.swift
//  VK App
//
//  Created by Aleksander Pankow on 03/10/2020.
//

import UIKit
import RealmSwift

class UserPhotoViewController: UICollectionViewController {
    
    
    @IBOutlet var userPhotos: UICollectionView!
    
    private lazy var photos = try? Realm().objects(PhotoList.self)
    var realmtoken: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ApiRequest.loadPhotos(token: NetworkSession.shared.token) { [weak self]
            photos in try? RealmService.save(items: photos)
            self?.userPhotos.reloadData()
        }

        // Do any additional setup after loading the view.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath as IndexPath) as! PhotosListCell
        
        let downloadPhoto = photos![indexPath.row].url
        
        cell.photoImage.contentMode = .scaleAspectFill
        cell.photoImage.downloaded(from: downloadPhoto)
        
        return cell
        
    }

}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
