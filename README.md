# YogaOnlineStore - Магазин товаров для йоги

YogaOnlineStore - это iOS-приложение, написанное на SwiftUI, представляющее собой онлайн-магазин товаров для йоги. Приложение использует Firebase/Firestore для хранения и синхронизации данных в реальном времени. Пользователи могут просматривать товары, добавлять их в избранное и корзину, а также управлять количеством товаров в корзине.

## Функциональность

- **Каталог товаров:** Просмотр всех доступных товаров в виде сетки.
- **Избранное:** Возможность добавлять товары в избранное для быстрого доступа.
- **Корзина покупок:** 
  - Добавление товаров в корзину
  - Изменение количества товаров
  - Автоматический подсчет общей стоимости
  - Удаление товаров из корзины
- **Детальный просмотр:** Подробная информация о каждом товаре с описанием и ценой.
- **Синхронизация в реальном времени:** Мгновенное обновление данных благодаря Firestore.
- **Поддерживает светлую и темную темы.

  
## Скриншоты
| Главный экран (Светлая тема) | Главный экран (Темная тема) | Детальный просмотр (Светлая тема) | Детальный просмотр (Темная тема) |
| :---------: | :---------: | :---------: | :---------: |
|![Simulator Screenshot - iPhone 16 Pro - 2025-01-23 at 13 03 30](https://github.com/user-attachments/assets/c70d0416-6de1-406e-81d4-a5018028b407)|![Simulator Screenshot - iPhone 16 Pro - 2025-01-23 at 13 10 10](https://github.com/user-attachments/assets/6ac4e11d-aa9c-4fca-8fba-59e5fb882b16)|![Simulator Screenshot - iPhone 16 Pro - 2025-01-23 at 13 03 45](https://github.com/user-attachments/assets/d59d5a49-dc96-4b36-87ff-56d694729717)|![Simulator Screenshot - iPhone 16 Pro - 2025-01-23 at 13 10 39](https://github.com/user-attachments/assets/dd958cad-dfc8-4390-a4c5-2276032df20f)|




| Корзина (Светлая тема) | Корзина (Темная тема) | Избранное (Светлая тема) | Избранное (Темная тема) |
| :---------: | :---------: | :---------: | :---------: |
|![Simulator Screenshot - iPhone 16 Pro - 2025-01-23 at 13 06 28](https://github.com/user-attachments/assets/ca98fe7d-77d7-4379-a952-205243e5ff0e)|![Simulator Screenshot - iPhone 16 Pro - 2025-01-23 at 13 10 28](https://github.com/user-attachments/assets/77e09177-b1fd-4c15-bfa8-f06bfb37642b)|![Simulator Screenshot - iPhone 16 Pro - 2025-01-23 at 13 05 45](https://github.com/user-attachments/assets/23c59efc-c063-4693-ac88-4e85f512f978)|![Simulator Screenshot - iPhone 16 Pro - 2025-01-23 at 13 10 21](https://github.com/user-attachments/assets/f5105089-79eb-4aa7-a4b0-82dc96177929)|


## Технологии

- **SwiftUI:** Построение современного и отзывчивого пользовательского интерфейса.
- **Firebase/Firestore:** База данных реального времени для хранения информации о товарах.
- **@Observable:** Управление состоянием приложения.
- **Async/Await:** Асинхронные операции для работы с базой данных.

## Архитектура

- **MVVM (Model-View-ViewModel):** Проект реализован с использованием архитектурного паттерна MVVM.
  - **Model:** Структура данных товаров (ModelOfGoods)
  - **View:** Отдельные представления для главного экрана, избранного и корзины
  - **ViewModel:** Управление бизнес-логикой и взаимодействием с Firestore

## Требования

- **iOS 18+**
- **Xcode 16.0+**
- **Firebase проект** с настроенным Firestore
- **GoogleService-Info.plist** для конфигурации Firebase

## Установка

1. Клонируйте репозиторий
2. Добавьте ваш `GoogleService-Info.plist` в корень проекта
3. Установите зависимости Firebase через Swift Package Manager
4. Запустите проект в Xcode

