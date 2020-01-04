## Table View

App Development with Swift 교재 [Lesson 4.5 - Table View] 번역, 요약 정리 by [(HyunSikWon)](https://github.com/HyunSikWon)

---

### Vocabulary
**accessory view**

table view cell은 추가적인 정보를 표현하기 위한 accessory view를 갖는다. ex) .checkmark .detailIndicator


**index path**

cell의 section과 row를 구분하기 위해 사용된다. [section, row] 형태로 표현. *0부터 시작(Zero-based)*


**dequeue**

table view는 특별한 caching system을 사용하는데  이는 이미 화면에 표현된 cell을 재사용한다.

재사용 cell을 고르고 준비하는 과정을 'dequeuing'이라고 부른다.

~~~swift

let cell: UITableViewCell =
    tableView.dequeueReusableCell(withIdentifier: "Cell", for: IndexPath)

~~~


**readability margin**

Auto Layout을 이용해서 device에 따라 view의 readability margin을 조정할 수 있다.

또한, viewDidLoad() method에 cellLayoutMarginsFollowReadableWidth property를 true로 하면 가능




---

### Table View Controllers
table view의 사용 방식에 따라 project에서 table view를 사용하기 위한 2가지 방식이 있다.

1. 첫번째 방식은, view controller의 view에 직접 table view instance를 삽입하는 것이다.

이 방식 속에서 view controller는 table view 의외에 다른 view들을 관리한다.

따라서, table view의 **위치와 크기**를 관리해야 한다, 또한 data source와 delegate object를 세팅해야 한다.

2. 두번째 방식은, table view controller을 사용하는 것이다.

UITableViewController은 view controller의 subclass로 단일 table view instance를 관리한다.

table view가 전체 view를 차지하기 때문에 사이즈를 조정할 필요가 없다.

table view controller는 table view의 delegate와 data source의 역할도 한다.

---

### Table View Style
1. Plain(default)
- row가 labeled section으로 나뉠 수 있다. 각 section은 공간 간격을 두지 않고 바로 따라 온다.
2. Grouped
- row가  공간 간격을 두고 그룹 혹은 section으로 나뉘어 진다. 

---

### Table View Cells

Table view의 모든 row는 table view cell로 표현된다. - UITableViewCell instance

Cell은 reusable views이고 text, image 등 모든 UIView를 표현할 수 있다.

각 Cell은 optional accessory view를 갖는다.

UITableViewCell은 세가지 properties를 갖는다.

1. textLabel, title을 위한 UILabel
2. detailTextLabel, subtitle을 위한 UILabel
3. imageView, image를 위한 UIImageView

UIKit framework는 네가지 표준 cell style을 정의하고 Interface Builder 혹은 enum UITableViewCell.CellStyle을 사용할 수 있다.

table이 default mode(view-only)일 때 cell은 accessory view를 표현할 수 있다. 

이 역시 Interface Builder 혹은 enum UITableViewCell.AccessoryType을 이용해 사용할 수 있다.

delegate method를 사용하면 user가 accessory view를 탭할 때 상황에 맞는 반응을 할 수 있다.

---

### Table View Protocols
1. UITableViewDataSource

table view object에 필요한 데이터를 제공해주는 역할
 - how many rows are in the table
 - the contents of each cell
 
~~~swift

 optional func numberOfSections(in tableView: UITableView) -> Int 

 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int 
    
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell

~~~

table view가 load 혹은 reload될 때 위와 같은 methodemfdmf call 한다.

2. UITableViewDelegate 

UITableViewDelegate protocol, implements method to modify visible aspects of the table view, 
manage selections, support an accessoy view and support editing of individual rows. 

data source protocol과 달리 required methods가 존재하지 않음.

Apple 문서 참조할 것.

---

### Custom Table View Cells

필요에 따라 iOS SDK가 제공하는 cell style이 아닌 custom table view cell이 필요함.

InterFace Builder에서 cell style을 'Custom' 으로 설정

custom table view subclass 생성 후 

`tableView(_: cellForRowAt)`에서
~~~swift

let cell = tableView.dequeueReusableCell(withIdentifier : "EmojiCell", for : indexPath) as! EmojiTableViewCell

~~~
cell을 dequeue하면 method가 UITableViewCell instance를 반환하기 때문에 downcast 해야함.


### Edit Table View

table view가 editing mode에 들어가면 delegate method인 `tableView(_:editingStyleForRowAt)`을 호출한다.

edit style에는 .none, .delete, .insert 가 있다.

table view가 편집모드에 들어가면 몇몇 data source, delgate method들이 순차적으로 호출된다.

1. `tableView(_:canEditRowAt:)` - 특정 row를 편집에서 배제하기 위해 사용되나 대부분의 앱에서는 필요 없다.
2. `tableView(_:editingStyleForRowAt:)` - row의 editing style을 지정하기위해 사용된다.
3. 사용자가 editing control을 탭. deletion control이라면 App이 Delete 버튼을 나타낸다.
4. `tableView(_:commit:forRowAt:)` - step 3에서 사용자의 action을 반영하여 data model을 업데이트하기 위해 사용된다.

4번의 경우 optional이지만 row를 delete/insert 하기 위해선 반드시 수행해야 한다.

### Delete Items

step 2의 과정.
~~~swift

 override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
~~~

step3에서 user의 action은 아래와 같은 코드를 수행하게 한다.
~~~swift
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

~~~

삭제 과정에서 app은 백그라운드의 data(model)와 table view 자체(view)를 모두 업데이트 해야한다.

---

### Related Resources
- [Table View Programming Guide for iOS](https://developer.apple.com/documentation/uikit/views_and_controls/table_views)
- [API Reference : UITableView]()
- [API Reference : UITableViewDataSource](https://developer.apple.com/reference/uikit/uitableviewdatasource)
- [API Reference : UITableViewDelegate](https://developer.apple.com/documentation/uikit/uitableviewdelegate)
- [API Reference : UITableViewCell](https://developer.apple.com/documentation/uikit/uitableviewcell)
- [API Reference : UITableViewController](https://developer.apple.com/documentation/uikit/uitableviewcontroller)












