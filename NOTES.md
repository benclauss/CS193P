# CS193P

## [Course Website](https://cs193p.sites.stanford.edu/)

## [Lecture 1](https://youtu.be/bqu6BquVi2M)

```swift
import SwiftUI // "UI stuff"

struct ContentView: View {
    var body: some View { // This is a function! value of body is evaluated function
        Text("Hello, CS193p!")
            .padding()
    }
}
```

- We can have both variables and functions in structs.
  - This probably sounds like OOP.
  - Swift supports OOP
- `struct`s are **not** classes.
- Swift supports both functional programming and OOP.

- `struct ContentView: View` - This `struct` behaves like a `View`.
- "double edge sword"
  - get everything a `View` gets
  - You have to do everything a `View` does.
    - define `body`

A **View** is just a rectangular area on screen.

- can display text
- receive input via touch
- can set color
- can set padding
- and much more

We have to define a `var body`.

Normally, types are straightforward.
So, what is `some View`?

A view has to provide some thing that behaves like a view.
Lego analogy

If a function argument is not obvious, use a label (stems from Objective C).

## [Lecture 2](https://youtu.be/3lahkdHEhW8)

We can use an `HStack` to add multiple cards.
We want to DRY our code.

> Create a dining room chair LEGO.

In SwiftUI, we want our UIs to be small.

So, we define a separate struct for our card.

```swift
struct CardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .stroke(lineWidth: 3)
            Text("✈️")
                .font(.largeTitle)
        }
    }
}
```

In iOS 13, Apple introduced "Dark" and "Light" mode.
We can customize our preview.

```swift
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

This controls our preview.

- We can add modifiers to `ContentView()`.
- We can add multiple ContentViews to compare simultaneously.

**Fill**
We can't "create the racetrack" and fill it for `RoundedRectangle`.

**How do we add behavior?**
We can add logic to `View`.

**Variables must always have a value!**

- A function can return the value.

```swift
var isFaceUp: Bool { return false }
var isFaceUp: Bool = false
```

Otherwise, value must be provided on creation
Defaults within `struct` can be overwritten.

**Local Variables**

```swift
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20) // Compiler determines type.
        ZStack {
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text("✈️").font(.largeTitle)
            } else {
                shape.fill()
            }
        }
    }
```

`var` is variable.
`let` is for constants.

**Tap Gestures**
just a view modifier!
`.onTapGesture`

**All views in SwiftUI are immutable.**
New views are constantly being rebuilt.

`@State` makes `var` a pointer "somewhere in memory".
We don't use this very often.

`Option`-Click on type will provide documentation.

**Arrays**
`var emojis: Array<String> = ["🚡", "🚋", "🚃", "🚠"]`
`var emojis: [String] = ["🚡", "🚋", "🚃", "🚠"]`
`var emojis: = ["🚡", "🚋", "🚃", "🚠"]`

**List Indexing**

```swift
       HStack {
            ForEach(emojis[0..<5], id: \.self) { emoji in
                CardView(content: emoji)
            })
        }
```

https://developer.apple.com/sf-symbols/

**Review**
Build structures that behave like View.

- functional underpinning of Swift
- We will combine with OO next week.
  A view is a rectangular area on screen that provides enormous power.
  We can combine views to build complicated user interfaces.
  View Combiners (`Stack`s)
  `ForEach`s

`Stack` uses all size (height and width)
`LazyVGrid` uses all horizontal space but only what it needs vertically.

## [Lecture 3](https://www.youtube.com/watch?v=--qKOhdgJAs)

### MVVM

- Model-View-ViewModel
  - A "code organizing" architectural design paradigm
  - Must be adhered to for SwiftUI to work.
  - It is different from MVC (Model View Controller) that UIKit (old-style iOS) uses.

It is similar to MVC in that it has a **Model** and **View**.

- View is made of `View`s.

#### Model

- UI Independent.
- Data + Logic
  - "what your application does"
  - all the cards
  - decision making
  - what makes a match, how many points
- "The Truth"
- We're always going to ask the model if a card is face up.
  - That way we don't need to worry about "truth" existing in 2 places.
- Data flows from the Model to the View.

#### View

- Reflects the Model
- Stateless
  - When do we use `@State` then?
    - Those things only have to do with how the UI is managing itself (e.g. picking a theme).
- Declared
- Reactive
  - always reacting to changes in the model

#### ViewModel

- Binds View to Model
- Interpreter
  - ViewModel might present SQL data as an array that the View would prefer.
  - "exactly what the view needs"
- Gatekeeper
  - access to the Model is well-behaved

**The View must always access data from the Model via the ViewModel.**

- ViewModel notices changes in the Model.
- ViewModel publishes "something changed".
  - ViewModel does not want any connections to View.
- View automatically observes publications, pulls data and rebuilds.

**What about the other direction?**

- ViewModel has additional responsibility of processing intent.
- View calls Intent function.
- ViewModel modifies the Model.

### Swift Type System

#### struct and class

- Both have pretty much the same syntax.
- Both have
  - stored `var`s
  - computed `var` (e.g. `body`)
  - constant `let`s
  - `func`tions
  - `init`ializers (special functions called when creating a `struct` or `class`)
    - can have as many as you want
- So, what's the difference?

| struct                                                                   | class                                                                                      |
| ------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ |
| Value type                                                               | Reference type                                                                             |
| Copied when passed or assigned                                           | Passed around via pointers                                                                 |
| Copy on write                                                            | Automatically reference counted                                                            |
| Functional programming                                                   | Object-oriented programming                                                                |
| No inheritance                                                           | Inheritance (single)                                                                       |
| "Free" `init` initializes ALL `var`s                                     | "Free" `init` initializes NO `var`s                                                        |
| Mutability must be explicitly stated                                     | Always mutable                                                                             |
| Your "go to" data structure                                              | Used in specific circumstances                                                             |
| Everything seen so far is a `struct` (except `View` which is a protocol) | The ViewModel in MVVM is always a `class` (also, `UIKit` (old style iOS) is `class`-based) |

#### Generics

- Sometimes we just don't care
  - We may want to manipulate data structures that are "type agnostic" about.
  - In other words, we don't know what type something is and we don't care.
  - But Swift is a strongly-typed language, so we don't use variables and such that are "untyped".
  - So how do we specify the type of something when we don't care what type it is?
  - We use a "don't care" type (we call this feature "generics")...
- Example of a user of a "don't care" type: Array
  - An Array contains a bunch of things and it doesn't care at all what type they are!

```
struct Array<Element> {
	...
	func append(_ element: Element) { ... }
}
```

- The type of the argument to append is Element. A "don't care" type.
- Array's implementation of append knows nothing about that argument and it does not care
- Element is not any known struct or class or protocol, it's just a placeholder for a type.

Swift combines Generics with protocols!

#### functions

- You can declare a variable (or parameter to a func or whatever) to be of type "function".
- The syntax for this includes the types of the arguments and return value.
- You can do this anywhere any other type is allowed.
- can have internal and external labels, in that order

##### Closures

- It's so common to pass functions around that we are very often "inlining" them.
- We'll call such an inlined function a "closure" and there's special language support for it.

`import Foundation`

- Array, String, Dictionary

`struct`s can be nested.

`private(set)` You can look but not touch.

Swift only has `for` `in`.

```swift
for pairIndex in 0..<numberOfPairsOfCards {

}
```

Use type inference when defining vars/lets.
Use `in` when defining functions inline.

```swift
MemoryGame<String>(numberOfPairsOfCards: 4, createCardContent: { (index: Int) -> String in
	return "😀"
})
```

```swift
static let emojis = ["🚧", "🚆", "🚡", "🚘", "🛣️", "🛳️", "🛤️", "🚏", "🚖", "🚢", "🛫", "🚐", "🚎", "🚄", "🚑", "🛢️", "🚜", "🚦", "🚉" , "🚲", "🚥", "🚓", "🛩️", "🛑"]
```

Functions can also be static.
This can be useful for avoiding polluting the global namespace.

`.largeTitle` and `.white` are static members of `Font` and `Color`.
Type inference prevents the need to explicitly state prefix.

## [Lecture 4](https://www.youtube.com/watch?v=oWZOFSYS5GE)

- `print` statements only work with simulator.
- Arguments to functions are `let`s.
- `cards[index]` **copies**.
- `ObservableObject` publishes "will change".
  - Call `objectWillChange`.
- `@Published` will do this automatically.
- `@ObservedObject` will reuild thing when it changes (i.e. in view).

### enum

- Another variety of data structure in addition to struct and class
  - It can only have discrete states.
  - An enum is a value type (like struct), so it is copied as it is passed around.
- Each state can (but does not have to) have its own associated data.
- Fields do not have to have labels.
- An enum's state is usually checked with a `switch` statement
- A Switch must hanle all possible cases (although you can `default` uninteresting cases)
- Switch works on other types.
- Each case in a switch can be a multiple lines and does **not** fall through to the next case.
  - You can fallthrough explicitly.
- Associated data is accessed through a switch statement using `let` syntax.
  - You can retrieve associated data using a different name.
- Methods and Properties
  - but **not stored properties**
  - In an enum's own method, you can test the enum's state (and get associated data) using `self`
- Getting all the cases of an enumeration
  - a static var `allCases` that you can iterate over
- `Size` was an enum with associated data.
  - Some had default values.
- Labels are also optional.

### Optionals

- An Optional is just an enum. Period, nothing more.
- You can see that it can only have two values: is set (some) or not set (none)
  - In the set case, it has some associated value.
- Swift introduces a lot of "syntactic sugar" to make it easy to use Optionals.
- Delcaring something of type `Optional<T>` can be done with the syntax `T?`.
- You can assign it the value `nil` (`Optional.`none).
- Or you can it assign it something of the type T (`Optional.some` with associated value)
- always start out with an implicit `= nil`
- You can access the associated value
  - by force with `!` (will crash program)
  - `if let safehello = hello { ... } else { ... }`
- There's also `??` which does "Optional defaulting". It's called the "nil-coalescing operator".
- Optional chaining
  - `x?.foo()?.bar?.z`

### Review

- MVVM
  - Models
    - UI-Independent
    - no reference to Views
    - data and logic
    - "the truth"
  - View
    - reflect the Model
    - Remove `@State` (in model)
    - declarative
    - reactive
  - ViewModel
    - binds View to Model
    - interpretation
    - "gatekeeper"
      - keeps Model private
    - enables reactive architecture
  - MemoryGame is a struct.
    - Swift can identify changes and notify world.
    - `@Published`, `@ObservableObject`
