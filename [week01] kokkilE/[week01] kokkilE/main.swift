//👨‍🔬 실험 2: Optional을 활용한 경우 예외사항을 처리해 봅시다.

var budget: Int = 2000
var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]
let lastIndexOfProductList = productsList.count - 1
let price = 1000

enum BuyProductError: Error {
    case noBudget, wrongProductNumber, noProductStock
}

func buy(productNumber: Int) throws {
    guard productNumber <= lastIndexOfProductList && productNumber >= 0 else {
        throw BuyProductError.wrongProductNumber
    }
    
    guard let productToBuy = productsList[productNumber] else {
        throw BuyProductError.noProductStock
    }
    
    guard budget >= price else {
        throw BuyProductError.noBudget
    }
    
    productsList[productNumber] = nil
    budget -= price
    
    print("\(productToBuy)을(를) 구매하였습니다.")
    print("예산이 \(price) 차감됩니다.")
}

func tryBuyProduct(productNumber: Int) {
    print("선택된 상품 번호: \(productNumber)")
    do {
        try buy(productNumber: productNumber)
    } catch BuyProductError.wrongProductNumber {
        print("Error!: 상품 번호를 확인하세요. 0 - \(lastIndexOfProductList)")
    } catch BuyProductError.noProductStock {
        print("Error!: 해당 상품의 재고가 없습니다.")
    } catch BuyProductError.noBudget {
        print("Error!: 예산이 \(price - budget) 만큼 부족합니다.")
    } catch {
    }
    
    showBudgetAndStock()
}

func showBudgetAndStock() {
    print("재고 현황: ", terminator: "")
    
    for product in productsList {
        if let noOptional = product {
            print(noOptional, terminator: " ")
        } else {
            print("nil", terminator: " ")
        }
    }
    print("")
    
    print("잔여 예산: \(budget)")
    print("--------------------------")
}

var userInputNumber = 6
tryBuyProduct(productNumber: userInputNumber)

userInputNumber = 1
tryBuyProduct(productNumber: userInputNumber)

userInputNumber = 2
tryBuyProduct(productNumber: userInputNumber)

userInputNumber = 1
tryBuyProduct(productNumber: userInputNumber)

userInputNumber = 0
tryBuyProduct(productNumber: userInputNumber)
