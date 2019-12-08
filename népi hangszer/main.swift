//
//  main.swift
//  népi hangszer
//
//  Created by Gergely Kovacs on 2019. 03. 28..
//  Copyright © 2019. Gergely Kovacs. All rights reserved.
//

import Foundation


class Node {
    let value: String
    var leftNode: Node?
    var rightNode: Node?
    
    init(value: String, leftNode: Node?, rightNode: Node?) {
        self.value = value
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}
// leaf nodes
let cimbalomLeaf = Node(value: "Cimbalom", leftNode: nil, rightNode: nil)
let brácsaLeaf = Node(value: "Brácsa", leftNode: nil, rightNode: nil)
let harmonikaLeaf = Node(value: "Harmonika", leftNode: nil, rightNode: nil)
let furulyaLeaf = Node(value: "Furulya", leftNode: nil, rightNode: nil)
let hegedűLeaf = Node(value: "Hegedű", leftNode: nil, rightNode: nil)
let dudaLeaf = Node(value: "Duda", leftNode: nil, rightNode: nil)
let köcsögdudaLeaf = Node(value: "Köcsögduda", leftNode: nil, rightNode: nil)
let ütőgardonLeaf = Node(value: "Ütőgardon", leftNode: nil, rightNode: nil)
let kobozLeaf = Node(value: "Koboz", leftNode: nil, rightNode: nil)
let klarinétLeaf = Node(value: "Klarinét", leftNode: nil, rightNode: nil)
let citeraLeaf = Node(value: "Citera", leftNode: nil, rightNode: nil)
let tekerőLeaf = Node(value: "Tekerőlant", leftNode: nil, rightNode: nil)
let nagybőgőLeaf = Node(value: "Nagybőgő", leftNode: nil, rightNode: nil)
// final nodes
let szomszNode = Node(value: "Van szomszédod?\nigen\nnincs:\n ", leftNode: harmonikaLeaf, rightNode: hegedűLeaf)
let kombiNode = Node(value: "Kombi autód van?\nigen\nnem:\n ", leftNode: ütőgardonLeaf, rightNode: nagybőgőLeaf)
let kávéNode = Node(value: "Szeretsz kávét darálni?\nigen\nnem:\n ", leftNode: dudaLeaf, rightNode: tekerőLeaf)
let ujjNode = Node(value: "Megvan mind a tíz ujjad?\nigen\nnincs:\n ", leftNode: citeraLeaf, rightNode: klarinétLeaf)
//half final
let szekNode = Node(value: "Szoktál szekrényt pakolni?\nigen\nnem:\n ", leftNode: cimbalomLeaf, rightNode: szomszNode)
let kottaNode = Node(value: "Megtanultál kottát olvasni?\nigen\nnem:\n ", leftNode: brácsaLeaf, rightNode: szekNode)
let csajNode = Node(value: "Be akarsz csajozni, vagy pasizni?\nigen\nnem:\n ", leftNode: köcsögdudaLeaf, rightNode: kombiNode)
let akkordNode = Node(value: "Négy akkorddal egészen jól eleszel?\nigen\nnem:\n ", leftNode: ujjNode, rightNode: kobozLeaf)
let gyakNode = Node(value: "Akarsz sokat gyakorolni?\nigen\nnem:\n ", leftNode: csajNode, rightNode: furulyaLeaf)
//intermediate nodes
let szolfNode = Node(value: "Van kitartásod a szolfézshoz?\nigen\nnincs:\n ", leftNode: kottaNode, rightNode: gyakNode)
let hívNode = Node(value: "Szeretnéd, ha folyamatosan hívnának?\nigen\nnem:\n ", leftNode: kávéNode, rightNode: akkordNode)
let pénzNode = Node(value: "Van egy kis félretett pénzed?\nigen\nnincs:\n ", leftNode: hívNode, rightNode: gyakNode)
// ROOT Node
let rootNode = Node(value: "Profi népzenész szeretnél lenni?\nigen\nnem:\n ", leftNode: szolfNode, rightNode: pénzNode)

struct BinaryQuiz {
    let question: Node
 
    mutating func startQuiz(question: Node) {
     
        var tempQuestion = question
     
        print(tempQuestion.value)
        while tempQuestion.rightNode != nil && tempQuestion.leftNode != nil {
            
               let answer = readLine()
                switch answer {
                case "igen":
                    tempQuestion = tempQuestion.rightNode!
                    startQuiz(question: tempQuestion)
                case "van":
                    tempQuestion = tempQuestion.rightNode!
                    startQuiz(question: tempQuestion)
                case "nem":
                    tempQuestion = tempQuestion.leftNode!
                    startQuiz(question: tempQuestion)
                case "nincs":
                    tempQuestion = tempQuestion.leftNode!
                    startQuiz(question: tempQuestion)
                default:
                    print("igen / nem")
                    break
                }
            if tempQuestion.leftNode == nil && tempQuestion.rightNode == nil {
                print("Újrapróbálod? i/n ")
                let restartAnswer = readLine()?.lowercased()
                if restartAnswer == "i" || restartAnswer == "igen" {
                    startQuiz(question: rootNode)
                } else if restartAnswer == "n" || restartAnswer == "nem" {
                    exit(0)
                } else {
                    print("válasz: igen / nem, i / n")
                }
//               exit(0)
            }
        }
    }
}



var hangszerKvíz = BinaryQuiz(question: rootNode)
hangszerKvíz.startQuiz(question: rootNode)









