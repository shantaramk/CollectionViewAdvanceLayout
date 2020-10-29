//
//  ViewController.swift
//  CollectionViewAdvanceLayout
//
//  Created by Shantaram K on 24/10/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }
    
    func configureView() {
        configureCollectionView()
    }
    
    func configureCollectionView() {
        collectionview.register(UINib(nibName: "PictureCell", bundle: nil), forCellWithReuseIdentifier: "PictureCell")
        collectionview.collectionViewLayout = createDistinctSectionsLayout()
        collectionview.dataSource = self
        collectionview.reloadData()
    }

    //MARK:- ListView Layout
    func createListLayout() -> UICollectionViewLayout {

        //Item Size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension:  .fractionalHeight(1.0))
        //item
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        //group Size
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(100))
        //group
        //let gourp = NSCollectionLayoutGroup(layoutSize: groupSize, supplementaryItems: [NSCollectionLayoutSupplementaryItem])
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        //Section
        let section = NSCollectionLayoutSection(group: group)

        //Layout
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

    //MARK:- GridView Layout
    private func createGridLayout() -> UICollectionViewLayout {

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                              heightDimension: .fractionalHeight(1.0))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        // the add for the each item The the allocate same, box
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalWidth(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

    //MARK:- Two Column View Layout
    func createTwoColumnLayout() -> UICollectionViewLayout {

        //Item Size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension:  .fractionalHeight(1.0))
        //item
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let spacing = CGFloat(10)

        //group Size
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(100))
        //group
        //let gourp = NSCollectionLayoutGroup(layoutSize: groupSize, supplementaryItems: [NSCollectionLayoutSupplementaryItem])
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)

        group.interItemSpacing = .fixed(spacing)

        //Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)

        //Layout
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

    //MARK:- Distinct Sections Layout
    func createDistinctSectionsLayout() -> UICollectionViewLayout {

        //Item Size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension:  .fractionalHeight(1.0))
        //item
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let spacing = CGFloat(10)

        //group Size
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(100))
        //group
        //let gourp = NSCollectionLayoutGroup(layoutSize: groupSize, supplementaryItems: [NSCollectionLayoutSupplementaryItem])
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)

        group.interItemSpacing = .fixed(spacing)

        //Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)

        //Layout
        let layout = UICollectionViewCompositionalLayout { (section, _) -> NSCollectionLayoutSection? in

            if section == 0 {
                return self.bannerLayout()
            } else if section == 1 {
                return self.horizonalItemLayout()
             } else {
                return self.listItemLayout()
            }
        }
        return layout
    }

    func bannerLayout() -> NSCollectionLayoutSection {
        //Item Size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension:  .fractionalHeight(1.0))
        //item
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let spacing = CGFloat(0)

        //group Size
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(200))
        //group
        //let gourp = NSCollectionLayoutGroup(layoutSize: groupSize, supplementaryItems: [NSCollectionLayoutSupplementaryItem])
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)

        group.interItemSpacing = .fixed(spacing)

        //Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)
        section.orthogonalScrollingBehavior = .paging
        return section
    }

    func horizonalItemLayout() -> NSCollectionLayoutSection {
        //Item Size
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(150),
                                              heightDimension: .absolute(150))
        //item
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let spacing = CGFloat(10)

        //group Size
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(150))
        //group
        //let gourp = NSCollectionLayoutGroup(layoutSize: groupSize, supplementaryItems: [NSCollectionLayoutSupplementaryItem])
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)

        group.interItemSpacing = .fixed(spacing)

        //Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }

    func listItemLayout() -> NSCollectionLayoutSection {
        //Item Size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension:  .fractionalHeight(1.0))
        //item
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        //group Size
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(100))
        //group
        //let gourp = NSCollectionLayoutGroup(layoutSize: groupSize, supplementaryItems: [NSCollectionLayoutSupplementaryItem])
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        let spacing = CGFloat(2)

        group.interItemSpacing = .fixed(spacing)

        //Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing

        return section

       }
}

extension ViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        } else if section == 1 {
            return 8
        } else {
            return 15
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let pictureCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureCell", for: indexPath) as? PictureCell else { fatalError()}
        pictureCell.titleLabel.text = "\(indexPath.row)"
        return pictureCell
    }
}
