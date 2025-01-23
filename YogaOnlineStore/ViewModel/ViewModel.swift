import SwiftUI
import FirebaseFirestore
import Observation

@Observable
final class ViewModel {
    /// Массив всех товаров, получаемых из Firestore
    var items: [ModelOfGoods] = []
    
    /// Ссылка на коллекцию 'YogaShop' в Firestore
    private let firestoreDatabase = Firestore.firestore().collection("YogaShop")
    
    /// Вычисляемое свойство, возвращающее количество товаров в корзине
    /// Считает только товары с quantity > 0
    var count: Int {
        items.filter{ $0.quantity ?? 0 > 0 }.count
    }
    
    /// Вычисляемое свойство, возвращающее общую стоимость товаров в корзине
    /// Считает сумму произведений цены на количество для каждого товара
    var total: Int {
        items.reduce(0) { $0 + ($1.price * ($1.quantity ?? 0)) }
    }
    
    /// Инициализатор, который запускает первичную загрузку данных
    init() {
        fetch()
    }
    
    /// Приватный метод для обновления данных товара в Firestore
    /// - Parameters:
    ///   - goods: Модель товара для обновления
    ///   - data: Словарь с обновляемыми полями и их значениями
    private func update(goods: ModelOfGoods, data: [String : Any]) {
        guard let id = goods.id else { return }
        firestoreDatabase.document(id).updateData(data)
    }
    
    /// Метод для получения и отслеживания изменений данных из Firestore
    /// Использует addSnapshotListener для реального времени
    func fetch() {
        firestoreDatabase.addSnapshotListener { shop, error in
            guard let document = shop?.documents else {
                print("Error: \(error!)")
                return
            }
            self.items = document.compactMap { document -> ModelOfGoods? in
                try? document.data(as: ModelOfGoods.self)
            }
        }
    }
    
    /// Метод для переключения состояния избранного товара
    /// - Parameter goods: Товар, для которого меняется состояние избранного
    func togle(goods: ModelOfGoods) {
        update(goods: goods, data: ["isFavoriteProduct" : !goods.isFavoriteProduct])
    }
    
    /// Метод для добавления единицы товара в корзину
    /// - Parameter goods: Товар для добавления в корзину
    func addGoodsUnitToCart(goods: ModelOfGoods) {
        update(goods: goods, data: ["quantity" : 1])
    }
    
    /// Метод для удаления товара из корзины
    /// - Parameter goods: Товар для удаления из корзины
    func removeGoodsUnitFromCart(goods: ModelOfGoods) {
        update(goods: goods, data: ["quantity" : 0])
    }
    
    /// Метод для увеличения количества товара в корзине на 1
    /// - Parameter goods: Товар, количество которого увеличивается
    func addMoreProduct(goods: ModelOfGoods) {
        let newQuantity = (goods.quantity ?? 0) + 1
        update(goods: goods, data: ["quantity" : newQuantity])
    }
    
    /// Метод для уменьшения количества товара в корзине на 1
    /// Минимальное количество не может быть меньше 1
    /// - Parameter goods: Товар, количество которого уменьшается
    func reduceTheQuantityOfGoods(goods: ModelOfGoods) {
        let currentQuantity = goods.quantity ?? 0
        let newQuantity = max(currentQuantity - 1, 1)
        update(goods: goods, data: ["quantity" : newQuantity])
    }
}


