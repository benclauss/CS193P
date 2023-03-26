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
