// LoginFormController.swift
// Copyright © Polina. All rights reserved.

import UIKit

final class LoginFormController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet private var loginInputTextField: UITextField!
    @IBOutlet private var passwordInputTextField: UITextField!
    @IBOutlet private var scrollView: UIScrollView!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        hideGesture()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        signToNotifications()
    }

    override func viewWillDisappear(_ animated: Bool) {
        notificationsDisappear()
    }

    // MARK: - IBActions

    @IBAction private func enterButton(_ sender: Any) {
        guard let login = loginInputTextField.text else { return }
        guard let password = passwordInputTextField.text else { return }

        if login == "admin", password == "123456" {
            print("успешная авторизация")
        } else {
            print("неуспешная авторизация")
        }
    }

    // MARK: - Private Methods

    private func hideGesture() {
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(hideKeyboardGesture)
    }

    private func signToNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWasShown(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillBeHiden(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
    }

    private func notificationsDisappear() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWasShown(notification: Notification) {
        guard let info = notification.userInfo as NSDictionary? else { return }
        guard let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue)?.cgRectValue.size
        else { return }
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)

        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }

    @objc private func keyboardWillBeHiden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
    }

    @objc private func hideKeyboard() {
        scrollView?.endEditing(true)
    }
}
