Delegate Pattern
---
**Delegate Pattern** 이란 프로그램 안에서 어떤 객체를 대신하여 행동한다던가, 다른 객체와 협동하여 일할 수 있게끔 권한을 위임하는 패턴이다.

### WHY USE DELEGATION? 

- Delegation은 class 간의 상호 작용과 처리 작업을 전달하기 위한 가벼운 접근 방식이고.

  원문: Delegation, and the delegation pattern, is a lightweight approach to hand-off tasks and interactions from one class to another.


- 클래스 간의 요구사항을 전달하기 위해 단지 프로토콜만 필요하기 때문에 클래스 간의 결합도를 크게 줄일 수 있다.

  원문: You only need a protocol to communicate requirements between classes. This greatly reduces coupling between classes.

- 또한, 상호작용을 일으키는 클래스의 책임과 상호작용에 반응하는 클래스를 분리할 수 있다.

  원문: And it separates the responsibilities of the class that generates interactions from the class that responds to these interactions.
  
  
  ***결론적으로*** Delegation은 내가 통제하지 않은 코드 내에서 발생하는 이벤트를 hook into 하는데 좋은 방법이다.
  
  
원문:  In short, delegation is a great way to “hook into” events that happen within code you don’t control, without tightly-coupling your code or decreasing composability.


### 코드 예시 - 출처: https://learnappmaking.com/delegation-swift-how-to/

```Swift
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

```
