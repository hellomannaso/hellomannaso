
Users
    Profile Photo
    Nickname
    Description
    MBTI Type
    Job
    Location
    Characters History (Script - Character)

Scripts
    Title of Content
    Description of Content
    Characters
        Name
        MBTI Type
        Description
    Scenes
        Title of Scene
        Description of Scene
        Characters of Scene
        Script of Scene



When both a SingleChildScrollView and a ListView or another ScrollView widget are nested together, the scrolling behavior can become unpredictable and difficult to control. This is because both widgets are designed to handle scrolling, which can lead to conflicts between them.

In general, the scrolling priority is determined by the order of the widgets in the widget tree. The widget that is higher in the widget tree will have priority over the widget that is lower in the tree. So if a ListView is nested inside a SingleChildScrollView, the ListView will have priority over the SingleChildScrollView.

Similarly, if a ListView or another ScrollView widget is nested inside a Column, the ListView or ScrollView will have priority over the Column.

Here are some things to keep in mind when working with nested scrolling widgets:

Avoid nesting multiple scrolling widgets together if possible, as it can lead to unpredictable scrolling behavior.

If you must nest scrolling widgets, make sure that the widget with the highest priority is the outermost widget.

If you need to disable scrolling on a nested widget, use a NeverScrollableScrollPhysics or set the primary property to false to prevent user-initiated scrolling.

If you need to synchronize scrolling between two or more scrolling widgets, use a ScrollController to control the scrolling behavior.