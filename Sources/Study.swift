//
//  Study.swift
//  osxcmd
//
//  Created by 凌佳 on 15/11/22.
//  Copyright © 2015年 凌佳. All rights reserved.
//

// TODO:
// 可以输出一个学习的结构树
class Study {
    private var cusor: String
    private var master: [String:[Paragraph]]!
    // Master
    //    Chapter
    //      Paragraph
    //
    init() {
        self.cusor = ""
        self.master = Dictionary()
    }

    func chapter(newTitle title: String) -> Study! {
        self.master[title] = []
        self.cusor = title
        return self
    }

    func chapter(exitTitle title: String) -> Study! {
        self.cusor = title
        return self
    }

    func paragraph(title: String, _ doSomeThing: () -> Void) -> Study! {
        self.master[self.cusor]?.append(Paragraph(title: title, handler: doSomeThing))
        return self
    }

    func run() -> Void {
        for (chapterTitle, paragraphs) in self.master {
            print(">>>>>>>>>>>>>\(chapterTitle)>>>>>>>>>>>>>")
            for paragraph in paragraphs {
                print("///////////////\(paragraph.title)/////////////")
                paragraph.handler()
                print("/////////////////end///////////////")
            }
            print(">>>>>>>>>>>>>>>>end>>>>>>>>>>>>>>>>")
        }
    }
}
class Paragraph {
    var handler:() -> Void!
    var title:String!

    init(title: String, handler:() -> Void) {
        self.handler = handler
        self.title = title
    }
}
