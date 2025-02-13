/*
made by Pirrow
welcome to my website:
https://sigma-pirrow.github.io/
*/

^!SPACE::  
{
    Winset, Alwaysontop, , A
}

+T::
{
    __UrlA:="https://dict.youdao.com/result?word="
    __UrlB:="&lang=en"
    __WebsiteName:=""
    clipboard_save:= clipboard
    clipboard:=""
    Send ^{c}
    Sleep 100
    __keyWord:= clipboard
    Clipboard = %clipboard_save%
    if not __keyWord {
        if not __WebsiteName{
            __WebsiteName:=__UrlA
        }
        InputBox, __keyWord,搜索关键字,%__WebsiteName%,,,150
    }
    if (ErrorLevel=0 and __keyWord!=""){
        VarSetCapacity(__Var, StrPut(__keyWord, "UTF-8"), 0)
        StrPut(__keyWord, &__Var, "UTF-8")
        f := A_FormatInteger
        SetFormat, IntegerFast, H
        While __Code := NumGet(__Var, A_Index - 1, "UChar")
            If (__Code >= 0x30 && __Code <= 0x39 ; 0-9
                || __Code >= 0x41 && __Code <= 0x5A ; A-Z
                || __Code >= 0x61 && __Code <= 0x7A) ; a-z
                __Res .= Chr(__Code)
            Else
                __Res .= "%" . SubStr(__Code + 0x100, -1)
        SetFormat, IntegerFast, %f%
        Run %__UrlA%%__Res%%__UrlB%
        __Res:=""
        __Var:=""
    }
    _keyWord:=""
    Return
}

+A::
{
    __UrlA:="https://cn.bing.com/images/search?q="
    __UrlB:="&qs=n&form=QBIR&sp=-1&lq=0&pq=tuna&sc=10-4&cvid=78EEC2FA15E44A6B8B130E90EE2064B9&ghsh=0&ghacc=0&first=1"
       __WebsiteName:=""
    clipboard_save:= clipboard
    clipboard:=""
    Send ^{c}
    Sleep 100
    __keyWord:= clipboard
    Clipboard = %clipboard_save%
    if not __keyWord {
        if not __WebsiteName{
            __WebsiteName:=__UrlA
        }
        InputBox, __keyWord,搜索关键字,%__WebsiteName%,,,150
    }
    if (ErrorLevel=0 and __keyWord!=""){
        VarSetCapacity(__Var, StrPut(__keyWord, "UTF-8"), 0)
        StrPut(__keyWord, &__Var, "UTF-8")
        f := A_FormatInteger
        SetFormat, IntegerFast, H
        While __Code := NumGet(__Var, A_Index - 1, "UChar")
            If (__Code >= 0x30 && __Code <= 0x39 ; 0-9
                || __Code >= 0x41 && __Code <= 0x5A ; A-Z
                || __Code >= 0x61 && __Code <= 0x7A) ; a-z
                __Res .= Chr(__Code)
            Else
                __Res .= "%" . SubStr(__Code + 0x100, -1)
        SetFormat, IntegerFast, %f%
        Run %__UrlA%%__Res%%__UrlB%
        __Res:=""
        __Var:=""
    }
    _keyWord:=""
    Return
}

+S::
{
    ClipSaved := ClipboardAll
    FilePath := "C:\Users\DELL\Desktop\picture.docx" 
    if FileExist(FilePath)
    {
        Run, % "winword.exe " . FilePath
    }
    else
    {
        MsgBox, The file path is invalid or the file does not exist.
        return
    }
    WinWait, ahk_class OpusApp, , 10

    WinActivate, ahk_class OpusApp

    WinWaitActive, ahk_class OpusApp, , 10 
    Send ^v
    Clipboard := ClipSaved
    ClipSaved := ""
    return
}

/*
made by Pirrow
welcome to my website:
https://sigma-pirrow.github.io/
*/




