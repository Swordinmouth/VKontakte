// LoginFormController.swift
// Copyright © Polina. All rights reserved.

import UIKit

final class LoginFormController: UIViewController {
    @IBOutlet private var loginInputTextField: UITextField!
    @IBOutlet private var passwordInputTextField: UITextField!
    @IBOutlet private var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваеваем его к UIScrollView
        scrollView.addGestureRecognizer(hideKeyboardGesture)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Подписываемся на уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWasShown(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        // Второе - когда она пропадает
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillBeHiden(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @IBAction private func enterButton(_ sender: Any) {
        // Получаем текст логина
        guard let login = loginInputTextField.text else { return }
        // Получаем текст-пароль
        guard let password = passwordInputTextField.text else { return }

        // Проверяем, верны ли они
        if login == "admin", password == "123456" {
            print("успешная авторизация")
        } else {
            print("неуспешная авторизация")
        }
    }

    // Когда клавиатура появляется
    @objc private func keyboardWasShown(notification: Notification) {
        // Получаем размер клавиатуры
        guard let info = notification.userInfo as NSDictionary? else { return }
        guard let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue)?.cgRectValue.size
        else { return }
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)

        // Добавляем отступ внизу ранвый размеру клавиатуры
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }

    // Когда клавиатура исчезает
    @objc private func keyboardWillBeHiden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
    }

    // Исчезновение клавиатуры при клике по пустому месту на экране и метод, который будет вызываться при клике.
    @objc private func hideKeyboard() {
        scrollView?.endEditing(true)
    }
}
