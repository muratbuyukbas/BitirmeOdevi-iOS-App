//
//  SettingsViewController.swift
//  TarifDefterim
//
//  Created by Murat Büyükbaş on 4/7/22.
//

import SafariServices
import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier: "cell")
        return table
    }()

    private var sections: [SettingsSection] = []

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Ayarlar"
        view.addSubview(tableView)
        configureModels()
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .systemBackground
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .close,
            target: self,
            action: #selector(didTapClose)
        )
        createTableFooter()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    @objc func didTapClose() {
        dismiss(animated: true, completion: nil)
    }

    private func configureModels() {
        sections.append(
            SettingsSection(title: "Kullanıcı", options: [
              
                SettingOption(
                    title: "Profili Düzenle",
                    image: UIImage(systemName: "gearshape"),
                    color: UIColor(red: 216/255, green: 67/255, blue: 57/255, alpha: 1)
                ) {
                    
                    let vc = EditProfileViewController()
                    let navVC = UINavigationController(rootViewController: vc)
                    navVC.modalPresentationStyle = .fullScreen
                    self.present(navVC, animated: true)
                }
            ])
        )

        sections.append(
            SettingsSection(title: "Uygulama", options: [
                SettingOption(
                    title: "Kullanım Şartları",
                    image: UIImage(systemName: "doc"),
                    color: UIColor(red: 216/255, green: 67/255, blue: 57/255, alpha: 1)
                ) { [weak self] in
                    DispatchQueue.main.async {
                        guard let url = URL(string: "https://muraat.com") else {
                            return
                        }
                        let vc = SFSafariViewController(url: url)
                        self?.present(vc, animated: true, completion: nil)
                    }
                },
                SettingOption(
                    title: "Gizlilik Politikası",
                    image: UIImage(systemName: "hand.raised"),
                    color: UIColor(red: 216/255, green: 67/255, blue: 57/255, alpha: 1)
                ) { [weak self] in
                    guard let url = URL(string: "https://muraat.com") else {
                        return
                    }
                    let vc = SFSafariViewController(url: url)
                    self?.present(vc, animated: true, completion: nil)

                }
            ])
        )
    }

    // Table

    private func createTableFooter() {
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: 50))
        footer.clipsToBounds = true

        let button = UIButton(frame: footer.bounds)
        footer.addSubview(button)
        button.setTitle("Çıkış Yap",
                        for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.addTarget(self, action: #selector(didTapSignOut), for: .touchUpInside)

        tableView.tableFooterView = footer
    }

    @objc func didTapSignOut() {
        let actionSheet = UIAlertController(
            title: "Çıkış Yap",
            message: "Çıkış yapmak istediğinden emin misin?",
            preferredStyle: .actionSheet
        )
        actionSheet.addAction(UIAlertAction(title: "Kapat", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Çıkış Yap", style: .destructive, handler: { [weak self] _ in
            AuthManager.shared.signOut { success in
                if success {
                    DispatchQueue.main.async {
                        let vc = SignInViewController()
                        let navVC = UINavigationController(rootViewController: vc)
                        navVC.modalPresentationStyle = .fullScreen
                        self?.present(navVC, animated: true)
                    }
                }
            }
        }))
        present(actionSheet, animated: true)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = sections[indexPath.section].options[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.title
        cell.imageView?.image = model.image
        cell.imageView?.tintColor = model.color
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = sections[indexPath.section].options[indexPath.row]
        model.handler()
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
}
