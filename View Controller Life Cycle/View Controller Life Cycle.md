View Controller Life Cycle
---
App Development with Swift 교재 [Lesson 3.8 - View Controller Life Cycle] 요약 정리 by [(HyunSikWon)](https://github.com/HyunSikWon)

---

### Vocabulary

---

### View Controller Life Cycle

iOS에는 몇몇 다른 상태가 있다.
1. View not loaded
2. View appearing
3. View appeared
4. View disappearing
5. View disappeared

view가 로드되면 will,did 쌍의 method가 나타나는데, 항상 같이 나타나는 것은 아니다.

#### View Did Load

view controller가 view를 로드하는 것이 완료되면, viewDidLoad() function이 호출된다.

이 function에서 주로 하는 작업은 network 요청, database 접근 등이 있다.

어떤 작업 단위가 한번만 수행된다면 viewDidLoad()에 작업을 추가하기 좋다.

#### View Will Appear and View Did Appear

viewDidLoad()가 수행된 후의 view controller life cycle의 다음 method는 viewWillAppear()이다. 

이 메소드는 view가 screen에 나타나기 직전에 수행된다.

view가 나타나기 전에 수행되어야 하는 작업들을 추가하기 좋다. network 요청을 시작하거나, view를 refresh 혹은 update하거나 등등.

viewDidAppear은 바로 다음에 수행된다. view가 나타난 후 수행되어야할 작업들을 추가학 좋다. animation 등등.

#### View Will Disappear and View Did disappear

view가 사라지기 전에 호출되는 viewWillDisappear() 메소드.

사용자가 back 버튼을 누르거나 tab을 전활할 때 modal창을 띄우거나 없앨 때 수행된다.

편집된 것을 저장하거나 키보드를 숨기거나 network 요청을 취소하는 작업등을 추가하기 좋다.

life cycle의 마지막 메소드는 viewDidDisappear(), view가 screen엣 사라진 직후 호출되는 메소드이다.

사용자가 새로운 view로 이동하고 나서 주로 호출된다.

이 메소드는 view와 관련된 service들을 멈추게 하는데 좋으 메소드이다. 음악 재생 등등.

---

### Related Resources
- [View Controller Programming Guide for iOS](https://developer.apple.com/library/content/featuredarticles/ViewControllerPGforiPhoneOS/#//apple_ref/doc/uid/TP40007457-CH2-SW1)
- [API Reference : UIViewController](https://developer.apple.com/reference/uikit/uiviewcontroller)

