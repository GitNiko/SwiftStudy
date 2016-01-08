//
//  Study.swift
//  osxcmd
//
//  Created by 凌佳 on 15/11/22.
//  Copyright © 2015年 凌佳. All rights reserved.
//

// TODO:
// 可以输出一个学习的结构树
public class Study {
    private var cusor: String
    private var master: [String:[Paragraph]]!
    // Master
    //    Chapter
    //      Paragraph
    //
    public init() {
        self.cusor = ""
        self.master = Dictionary()
    }

    public func chapter(newTitle title: String) -> Study! {
        self.master[title] = []
        self.cusor = title
        return self
    }

    public func chapter(exitTitle title: String) -> Study! {
        self.cusor = title
        return self
    }

    public func paragraph(title: String, _ doSomeThing: () -> Void) -> Study! {
        self.master[self.cusor]?.append(Paragraph(title: title, handler: doSomeThing))
        return self
    }

    public func run() -> Void {
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

    public func run(chapterTitle: String) -> Void {
        guard let chapter = self.master[chapterTitle] else {
            print("no exist chapter: \(chapterTitle)")
            return
        }
        for paragraph in chapter {
            print("///////////////\(paragraph.title)/////////////")
            paragraph.handler()
            print("/////////////////end///////////////")
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
