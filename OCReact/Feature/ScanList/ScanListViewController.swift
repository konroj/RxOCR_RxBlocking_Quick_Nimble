//
//  ScanListViewController.swift
//  OCReact
//
//  Created by Konrad Roj on 18/07/2019.
//  Copyright © 2019 Konrad Roj. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

final class ScanListViewController: UIViewController {
    private let bag = DisposeBag()
    private let viewModel: ScanListViewModel
    
    /* should consider moving it to View */
    private lazy var tableView = makeTableView()
    private lazy var addBarButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
    private lazy var imagePicker = UIImagePickerController(rootViewController: self)
    private lazy var spinner = UIActivityIndicatorView(style: .whiteLarge)
    private lazy var loadingView: UIView = UIView()

    init(viewModel: ScanListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupRxEvents()
    }
    
}

private extension ScanListViewController {
    
    func setupUI() {
        title = "OCReact" // should be localized key
        navigationItem.rightBarButtonItem = addBarButton
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func setupRxEvents() {
        addBarButton.rx.tap.asDriver()
        .throttle(.seconds(1), latest: false)
        .drive(onNext: { [weak self] (_) in
            self?.openCamera()
        })
        .disposed(by: bag)
        
        viewModel.items
        .bind(to: tableView.rx.items) {tv, ip, scan in
            let cell = tv.dequeueReusableCell(withIdentifier: "UITableViewCell")!
            cell.textLabel?.text = scan.text
            cell.textLabel?.numberOfLines = 0
            cell.imageView?.image = scan.image
            cell.selectionStyle = .none
            return cell
        }
        .disposed(by: bag)
    }
    
    func processImage(image: UIImage) {
        showActivityIndicator()
        viewModel.add(image: image).subscribe(onCompleted: { [weak self] in
            self?.hideActivityIndicator()
        }) { [weak self] (error) in
            self?.showError(message: error.localizedDescription) // some localized info
        }
        .disposed(by: bag)
    }
    
}

extension ScanListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension ScanListViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage, let image = pickedImage.normalized?.scaled(0.3) {
            processImage(image: image)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}

private extension ScanListViewController {
    
    func makeTableView() -> UITableView {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        return tableView
    }
    
    func showActivityIndicator() {
        loadingView = UIView()
        loadingView.backgroundColor = UIColor.gray.withAlphaComponent(0.90)
        loadingView.layer.cornerRadius = 10
        view.addSubview(loadingView)
        loadingView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(120.0)
        }
        
        spinner = UIActivityIndicatorView(style: .whiteLarge)
        loadingView.addSubview(spinner)
        spinner.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        spinner.startAnimating()
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    func hideActivityIndicator() {
        spinner.stopAnimating()
        loadingView.removeFromSuperview()
        navigationItem.rightBarButtonItem?.isEnabled = true
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            imagePicker.modalPresentationStyle = .overCurrentContext
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            showError(message: "Can't access camera on this device") // localized
        }
    }
    
    func showError(message: String) { // should be handled by some other entity
        let alert  = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
