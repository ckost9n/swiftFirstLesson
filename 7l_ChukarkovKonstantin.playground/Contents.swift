
print("Проверка банковской карты.\n1) Заблокированна карта банком или нет.\n2) Хватает ли средств на балансе для покупки товара")

enum CardError: Error {
    case smallBalance
    case blockedAccount
}

struct product {
    var price: Double
}

enum CardStatus {
    case isBlocked
    case isNotBlocked
}

class CardOpation {
    var balance: Double = 0
    var cardStatus = CardStatus.isNotBlocked
    
    func buySomething(product: product) throws {
        guard cardStatus == .isNotBlocked else {
            throw CardError.blockedAccount
        }
        guard product.price < self.balance else {
            throw CardError.smallBalance
        }
        balance = self.balance - product.price
    }
    
    func plusBalance (someMoney: Double) {
        balance = self.balance + someMoney
    }
    
    func printBalance() {
        print ("Баланс вашей карты \(balance) рублей")
    }
    
    func changeCardStatus(status: CardStatus){
        switch status {
        case .isBlocked: cardStatus = .isBlocked
        case .isNotBlocked: cardStatus = .isNotBlocked
        }
    }
     
}

let operation = CardOpation()


operation.plusBalance(someMoney: 10000)
operation.printBalance()
operation.changeCardStatus(status: .isBlocked)


do {
    try operation.buySomething(product: .init(price: 4500))
} catch CardError.smallBalance {
    print("Недостаточно средств на карте")
} catch CardError.blockedAccount {
    print("Ваша карта заблокирована")
}

operation.changeCardStatus(status: .isNotBlocked)

do {
    try operation.buySomething(product: .init(price: 45500))
} catch CardError.smallBalance {
    print("Недостаточно средств на карте")
} catch CardError.blockedAccount {
    print("Ваша карта заблокирована")
}
