Saving Data
---

App Development with Swift 교재 [Lesson 4.7 - Saving Data] 요약, 정리 by [(HyunSikWon)](https://github.com/HyunSikWon)

---

### Vocabulary

**archiving**

Archiving은 디스크에 저장된 file에 정보나 데이터를 저장하는 방법

**Documents directory**

Documents directory는 app의 데이터를 저장하기에 안전한 장소. 해당 앱만 접근 가능하고 다른 앱은 수정할 수 없기 때문에.

**Codable**

Class나 Struct 데이터를 JSON이나 Plist data같은 데이터로 encode하거나 decode할 수 있게하는 protocol

**Sandboxing**

Sandboxing model에서 각각의 앱은 그들 고유의 sandbox를 갖게된다. 

Sandbox에는 데이터를 생성, 삭제, 수정할 수 있지만 sandbox 외부의 자원을 사용하기 위해선 explicit permission이 필요하다.

**Serialization**

Serialization은 data structure를 하나의 포맷에서 다른 포맷으로 변환하느 과정을 말한다.

---

### Encoding and Decoding with Codable

Codable protocol을 채택하는 class는 instance들이 encode, decode 될 수 있도록 두개의 method를 반드시 implements해야 한다.

두개의 메소드는 init(from:)과 encode(to:)

객체가 Codable protocol을 채택하면 Encoder,Decoder를 객체를 encode, decode하기 위해 사용할 수 있다.

만약 model object가 이미 Codable을 따르는 타입의 property만을 가지고 있다면 두 메소드를 implements 할 필요없이 Codable선언만 하면 된다.

~~~swift

struct Note: Codable {
  let title: String
  let text: String
  let timestamp: Date
}
~~~
이미 String,Date Swift types은 Codable을 따르기 때문에 두개의 필수 메소드를 생성하지 않아도 된다.

~~~swift

let newNote = Note(title: "Grocery run", text: "Pick up mayonnaise, mustard, lettuce, tomato, and pickles.", timestamp: Date())

let pListEncoder = PropertyListEncoder()

if let encodedNote = try? pListEncoder.encode(newNote) {
    print(encodedNote)

    let pListDecoder = PropertyListDecoder()

    if let decodedNote = try? pListDecoder.decode(Note.self, from: encodedNote) {
        print(decodedNote)
    }
}
~~~

PropertyListEncoder의 encode(_:)메소드와 decode(_:from)는 throwing function으로 do-try-catch문이나 try?키워드를 사용해야 한다.

위 코드처럼 try?를 사용하면 optional Data를 리턴하고 오류를 throw하지 않는다.

---

### Writing data to a file

iOS apps work in the sanbox model. 

sanbox model의 일부로서 app은, 몇몇 directory를 data를 저장하기위해 갖는다.

이런 directory중 하나를 Document directory라고 부르고 앱과 관련된 데이터를 저장하거나 수정할 수 있다.

sandbox의 다른 특징은 앱이 메모리로 로드될 때마다 Document directory의 file path가 바뀐다.

directory의 contents는 그대로 있지만 address가 변한다.

Foundation framework는 disk의 file고 interacting하기 위해 사용되는 FileManager class를 정의한다.

---

### Related Resources

- [File System Programming Guide](https://developer.apple.com/library/content/documentation/FileManagement/Conceptual/FileSystemProgrammingGuide/FileSystemOverview/FileSystemOverview.html)
- [API Reference : Codable](https://developer.apple.com/documentation/swift/codable)
