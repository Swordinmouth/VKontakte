// Model.swift
// Copyright © Polina. All rights reserved.

import Foundation
/// Модель пользователя
struct User {
    var name: String
    var image: String
}

/// Модель групп
struct Group: Equatable {
    var name: String
    var image: String
}
