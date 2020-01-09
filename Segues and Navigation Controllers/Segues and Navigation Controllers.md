Segues and Navigation Controllers
---

### Vocabulary
**modal presentation**

modal presentation은 이전의 view controller 위에 새로운 view controller를 위치시키는 것.

최근 iOS 버전에선 화면을 다 차지하지 않고 아래에서 올라옴.

**root view controller**

화면에 표시되는 첫 view controller 혹은 scene. navigation stack의 맨 바닥.

**segue**

storyboard상에서 한 scene에서 다른 scence으로의 전환을 말한다.

**navigation controller**

navigation controller은 view controller subclass로 view controllers들의 backward와 forward의 transition은 관리한다.

---

### Segues

Segue는 한 view controller에서 다른 하나로의 전환을 정의하고, 새로 나타나는 view controller의 표현 방식 또한 정의한다.

새로운 view controller가 modal 형태로 나타나면 unwind segue를 사용하여 새로운 view controller을 없애고 이전의 것으로 돌아갈 수 있다.

unwind segue는 돌아올 view controller에

~~~swift
@IBAction func unwindToRed(unwindSegue : UIStoryboardSegue)
~~~
를 생성하여 storyboard에서 Exit에 연결해주면 된다.

---
### Navigation Controllers

어떤 상황에선 한 view controller에서 연관된 다른 view controller로 segue할 필요가 있다.(ex) Settings, 연락처, 건강 앱)

navigation controller은 화면이 나타날 때, 오른쪽에서 왼쪽으로 화면이 전환된다. 이는 스택에 쌓는 것.

back버튼을 누르면 stack상 현재 scene은 pop되고 다음으로 가장 높은 view controller이 나타난다. 이때는 화면이 반대로 전환된다.

Show seguesms navigation controller속에서 사용되는지 독립적으로 사용되는지에 따라 표현 방법이 다르다.

navigation controller속에서는 push,pop형태이고 독립적으로 사용될 땐 modally.

---
### Related Resources
- [View Controller Programming Guide for iOS: Using Segues](https://developer.apple.com/library/archive/featuredarticles/ViewControllerPGforiPhoneOS/UsingSegues.html)
- [API Reference : UINavigationController](https://developer.apple.com/documentation/uikit/uinavigationcontroller)
- [API Reference : UINavigationBar](https://developer.apple.com/documentation/uikit/uinavigationbar)
