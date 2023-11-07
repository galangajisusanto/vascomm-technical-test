//
//  HomeViewController.swift
//  Vasacom Test
//
//  Created by MEKARI on 02/10/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    enum HomeSection: Int {
        case healthInformation = 0
        case covidTest = 1
        case trackingProgress = 2
        case healthProduct = 3
        case healthService = 4
    }
    
    @IBOutlet weak var homeTableView: UITableView!
    
    private let healtServices: [HealthService] = [
        HealthService(id: 1, name: "PCR Swab Test (Drive Thru) Hasil 1 Hari Kerja", price: "Rp. 1.400.000", building: "Lenmarc Surabaya", location: "Dukuh Pakis, Surabaya", image: "building_1.png"),
        HealthService(id: 1, name: "PCR Swab Test (Drive Thru) Hasil 1 Hari Kerja", price: "Rp. 1.400.000", building: "Lenmarc Surabaya", location: "Dukuh Pakis, Surabaya", image: "building_2.png")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomeTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupHomeTableView() {
        homeTableView.separatorStyle = .none
        homeTableView.dataSource = self
        homeTableView.registerCell(HealthServiceTableViewCell.self)
        homeTableView.registerCell(HealthSolutionTableViewCell.self)
        homeTableView.registerCell(CovidTestTableViewCell.self)
        homeTableView.registerCell(TrackingProgressTableViewCell.self)
        homeTableView.registerCell(ProductTableViewCell.self)
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch HomeSection(rawValue: section) {
        case .healthInformation:
            return 1
        case .covidTest:
            return 1
        case .trackingProgress:
            return 1
        case .healthProduct:
            return 1
        case .healthService:
            return healtServices.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch HomeSection(rawValue: indexPath.section) {
        case .healthInformation:
            let cell = tableView.dequeueCell(HealthSolutionTableViewCell.self, indexPath: indexPath)
            cell.selectionStyle = .none
            return cell
        case .covidTest:
            let cell = tableView.dequeueCell(CovidTestTableViewCell.self, indexPath: indexPath)
            cell.selectionStyle = .none
            return cell
        case .trackingProgress:
            let cell = tableView.dequeueCell(TrackingProgressTableViewCell.self, indexPath: indexPath)
            cell.selectionStyle = .none
            return cell
        case .healthProduct:
            let cell = tableView.dequeueCell(ProductTableViewCell.self, indexPath: indexPath)
            cell.selectionStyle = .none
            return cell
        case .healthService:
            let cell = tableView.dequeueCell(HealthServiceTableViewCell.self, indexPath: indexPath)
            cell.selectionStyle = .none
            cell.healthService = healtServices[indexPath.row]
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch HomeSection(rawValue: section) {
        case .healthProduct:
            return "Pilih Produk Kesehatan Anda"
        case .healthService:
            return "Pilih Tipe Layanan Kesehatan Anda"
        default:
            return ""
        }
    }
}
