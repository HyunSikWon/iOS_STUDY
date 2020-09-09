import UIKit

struct Cookie {
    var size = 5
    var hasChocolateChips = false
}

protocol BakeryDelegate {
    func cookieWasBaked(_ cookie: Cookie)
    func preferedCookieSize() -> Int
}

// The power of delegation lies in the simple fact that the bakery doesn’t need to know where its cookies end up. It can provide them to any class that adopts the BakeryDelegate protocol!
// The bakery doesn’t need to know about the implementation of that protocol, only that it can call the cookieWasBaked(_:) function when needed.

class Bakery { // 쿠키를 굽기만 하면 된다. 파는 것은 위임.
    var delegate: BakeryDelegate?
    
    func makeCookies() {
        var cookie = Cookie()
        cookie.hasChocolateChips = true
        cookie.size = delegate?.preferedCookieSize() ?? 6
        delegate?.cookieWasBaked(cookie)
    }
}

class CookieShop: BakeryDelegate {
 
    // 쿠키를 파는 것을 위임 받았다.
    func cookieWasBaked(_ cookie: Cookie) {
        print("A new cookie was baked, with size \(cookie.size)")
    }
    
    func preferedCookieSize() -> Int { // 이 가게는 size 12의 쿠키를 선호한다.
         return 12
     }
    
}


let shop = CookieShop()
let bakery = Bakery()
bakery.delegate = shop

bakery.makeCookies()
