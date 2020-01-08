//
//  DictionaryVC.swift
//  EasyEnglish
//
//  Created by Ihor Mostoviy on 08.01.2020.
//  Copyright © 2020 Мостовий Ігор. All rights reserved.
//

import UIKit
import Floaty

final class DictionaryVC: UIViewController {

    // MARK: Properties
    private lazy var searchController = UISearchController(searchResultsController: nil)
    private var dispatchWorkItem: DispatchWorkItem?
    private var props: MainProps? {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: @IBOutlets
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.registerCell(WordCell.self)
            tableView.tableFooterView = .init(frame: .zero)
        }
    }
    @IBOutlet private weak var floatyButton: Floaty!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        setUpFloatyButton()
    }

    // MARK: Private functions
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        //searchController.searchBar.placeholder = "AllergensSelection.SearchBar.placeholder".localized()
        searchController.searchBar.tintColor = UIColor.white
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

   private func setUpFloatyButton() {
        floatyButton.sticky = true
        var icon = UIImage(named: "plus")
        floatyButton.addItem("Add word", icon: icon) { _ in
            self.searchController.dismiss(animated: false, completion: nil)
//            let storyboard = UIStoryboard(name: "AddNewWord", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: AddNewWordViewController.reuseIdentifier) as! AddNewWordViewController
//            vc.rootController = self
//            self.present(vc, animated: true, completion: nil)

        }

        icon = UIImage(named: "layers")
        floatyButton.addItem("Unchecked words", icon: icon) { _ in
            self.searchController.dismiss(animated: false, completion: nil)
//            let storyboard = UIStoryboard(name: "SelfAddedWords", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "SelfAddedWords") as! SelfAddedWordsViewController
//            self.present(vc, animated: true, completion: nil)

        }

        floatyButton.addItem("Test", icon: nil) { _ in
            self.searchController.dismiss(animated: false, completion: nil)
//            let storyboard = UIStoryboard(name: "TestWords", bundle: nil)
//            let controller = storyboard.instantiateViewController(withIdentifier: TestWordViewController.identifier) as! TestWordViewController
//            self.present(controller, animated: true, completion: nil)
        }
        view.addSubview(floatyButton)
    }
}

// MARK: - extension UISearchResultsUpdating
extension DictionaryVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text,
            let props = props else { return }
        dispatchWorkItem?.cancel()
        let searchingTask = DispatchWorkItem {
            props.searchTextChanged(searchText)
        }
        dispatchWorkItem = searchingTask
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: searchingTask)
    }
}

// MARK: - Extension UITableView Delegate and DataSourse
extension DictionaryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        (props?.cellProps.count).or(0)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let props = props else {
            return .init()
        }
        let cell: WordCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setUp(props.cellProps[indexPath.row])
        return cell
    }
}

// MARK: - Extension Props
extension DictionaryVC {
    struct MainProps {
        let cellProps: [WordCell.Props]

        let searchTextChanged: (String) -> Void
        let deleteWord: (IndexPath) -> Void
    }
}
