# SkeletonScreen
Skeleton Screen on iOS and iPadOS

### How to use

- Open `Xcode->File->Add Package Dependencies`

- Add Package via `https://github.com/huabin/SkeletonScreen.git`

- Import && Coding

  E.g.

  ```
  import SwiftUI
  import SkeletonScreen

  struct ContentView: View {
      var body: some View {
          SkeletonScreen(skeletonColor: Color(red: 220/255, green: 220/255, blue: 220/255), skeletonHeight: 20)
            .padding()
      }
  }
  ```

  - skeletonColor: Optional, RGB, default `.gray`

  - skeletonHeight: Optional, default `60`

### License

[MIT](LICENSE)

Copyright (C) 2024-present, Bin Hua