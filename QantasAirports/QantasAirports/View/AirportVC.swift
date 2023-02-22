//
//  AirportVC.swift
//  QantasAirport
//
//  Created by rakesh.e.mishra on 21/02/23.
//

import UIKit

class AirportVC: UIViewController {
    
    @IBOutlet weak var airportTable: UITableView!
    private var viewModel: AirportViewModel

    var loadingActivityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        indicator.color = .black
       
        indicator.autoresizingMask = [
            .flexibleLeftMargin, .flexibleRightMargin,
            .flexibleTopMargin, .flexibleBottomMargin
        ]
        indicator.startAnimating()
            
        return indicator
    }()
    
    required init?(coder aDecoder: NSCoder, viewModel: AirportViewModel) {
        self.viewModel = viewModel
        super.init(coder: aDecoder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        viewModel.fetchAirportData { [weak self] completion in
            self?.updateViews(isSuccess: completion)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupViews() {
        airportTable.estimatedRowHeight = 100
        airportTable.rowHeight = UITableView.automaticDimension
        
        loadingActivityIndicator.center = CGPoint(
                x: view.bounds.midX,
                y: view.bounds.midY
        )
        view.addSubview(loadingActivityIndicator)
    }
    
    func updateViews(isSuccess: Bool) {
        isSuccess ? airportTable.reloadData() : AlertManager.shared.showSimpleAlert(
            title: "Network Error",
            msg: "Please try again!",
            viewController: self, action: { [weak self] (_) in
                self?.viewModel.fetchOfflineAirportData(completion: { [weak self] completion in
                    self?.updateViews(isSuccess: completion)
                })
            }
        )
        loadingActivityIndicator.removeFromSuperview()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            if let indexPath = airportTable.indexPathForSelectedRow {
                print(viewModel.airPortDetailsForRow(indexPath: indexPath.row)?.airportName ?? "")
                let controller = segue.destination as? AirportDetailsVC
                controller?.airportName = viewModel.airPortDetailsForRow(indexPath: indexPath.row)?.airportName ?? ""
            }
        }
    }
}

extension AirportVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showDetails", sender: nil)
    }
}

extension AirportVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        cell.textLabel?.text = viewModel.airPortDetailsForRow(indexPath: indexPath.row)?.airportName

        return cell
    }
}
