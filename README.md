# SwiftUI-Updating-Bug
SwiftUI-Updating-Bug

I'm experiencing a bug where my SwiftUI views stop updating when I enable `@Environment(\.scenePhase)` in the `@main` App struct.

Here’s a simplified version of the code:

```
import SwiftUI

public class Backend {
    public init() {}
}

@main
struct swiftuibugApp: App {
    //@Environment(\.scenePhase) var scenePhase // <--- uncomment for bug
    
    let backend = Backend()
    
    var body: some Scene {
        WindowGroup {
            RouterView(
                backend: backend,
                setup: .generic
            )
        }
    }
}
```

When the `@Environment(\.scenePhase)` property is commented out, everything works as expected and the view updates properly. As soon as I uncomment that line, the view stops responding to state changes, as if the view is frozen or no longer observing the underlying model.

I’m not using `scenePhase` anywhere in the code yet—just declaring it seems to be enough to trigger the issue.

**Environment:**

* Xcode version: 16.3
* iOS version: 18.4