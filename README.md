# Size Class Issue

This is a demo project showcasing what looks like an issue with size classes on visionOS.

## Here's my expectation:

The `horizontalSizeClass` environment variable should reflect the size of the current window and allow me to update my interface accordingly. When resizing the window from a large canva, to make it smaller, it should be updated and transition from `.regular` to `.compact` at some point.  

In this sample project, I have a collection of colorful rounded rectangles. Depending on the horizontal size class, I want to change the layout from a two flexible columns LazyVGrid to a List. You can find this View in `ContentView.swift`.

## What is currently happening:

The `horizontalSizeClass` seems to be locked to the `.regular` value. Resizing the window to its smallest possible size never triggers any change of this value.

`ContentView` always feature a grid and never transition to a List.

## Reproduction steps

- Build this sample project for Apple Vision Pro Simulator.
- Resize the window and observe the behavior of the ContentView. Notice that it's always a Grid and that it never becomes a List.
- Notice the value in the center of the window. This is an overlayed geometry reader printing the view width. This geometry reader updates correctly. Which I find interesting because it narrows down the problem to size classes support.
- Optionally set a breakpoint to `ContentView.swift` line 23 and `ContentView.swift` line 30. You'll find that only the breakpoint for the Grid (23) is called. We never reach the breakpoint for the List (30). 

## Notes

This issue was diagnosed using visionOS SDK Beta 2. 
I was able to reproduce this issue on an actual Apple Vision Pro during a lab.
