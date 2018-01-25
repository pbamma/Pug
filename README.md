# iOS  Excercise
https://gist.github.com/moviestaylorwhere/782554e384e82f3520fbe0cc716ecdc3

Using Swift, write an app that calls this endpoint: https://pugme.herokuapp.com/bomb?count=50 and show the results in a grid.


---------------------------------------------------------------------------------

# Major functions

- When the user reaches the end of the grid, call the API again to load more items, and add the new items to the end of the grid (infinite scrolling).
- If the user taps and holds on a cell, copy the image to the user's clipboard
- When the user taps a cell, show a fullscreen version of the image.

# Architecture
MVC-N (Model View Controller Network)

Pods
 - Alamofire for networking
 - SDWebImage for simple image display
 - SwiftyJSON for model support

# Platform Requirements
iOS 11.0+
Xcode 9.2+
Swift 4.0+

# Data Source
https://pugme.herokuapp.com/bomb?count=50


# Review Testing


# Dev Notes


