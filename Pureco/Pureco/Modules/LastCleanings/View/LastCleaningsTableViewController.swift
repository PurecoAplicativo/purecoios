//
//  LastCleaningsTableViewController.swift
//  Pureco
//
//  Created by Giovani Pereira on 23/09/18.
//  Copyright © 2018 Pureco. All rights reserved.
//

import UIKit

class LastCleaningsTableViewController: UITableViewController {
    var viewModel: LastCleaningsViewModel?
    var presenter: LastCleaningPresenterProtocol?

    private var loadingView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = LastCleaningPresenter(view: self)
        presenter?.didLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? viewModel?.nextCleanings.count ?? 0 : viewModel?.oldCleanings.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let section = indexPath.section

        let cell: LastCleaningsTableViewCell?
        cell = tableView.dequeueReusableCell(withIdentifier: "lastCleaningsCell") as? LastCleaningsTableViewCell
        cell?.setup(cleaning: (section == 0 ? viewModel?.nextCleanings[row] :
                                              viewModel?.oldCleanings[row])!)
        return cell ?? UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ?
            (viewModel?.nextCleanings.count ?? 0 == 0 ? "" : "AGENDADOS") :
            (viewModel?.oldCleanings.count ?? 0 == 0 ? "" : "ANTIGOS")
    }

}

extension LastCleaningsTableViewController: LastCleaningViewControllerProtocol {
    func startLoading() {
        view.isUserInteractionEnabled = false
        loadingView = self.showFullScreenLoading()
    }

    func stopLoading() {
        view.isUserInteractionEnabled = true
        loadingView?.removeFromSuperview()
    }

    func setup() {
        self.tableView.reloadData()
    }
}
