//
//  FileReader.swift
//  WhoBilly
//
//  Created by Aleksander Pankow on 02/01/2022.
//

import Foundation
import SwiftyJSON

class GameSession {
    static func parse(gameNumber: Int) {
        
        var questionsList: [Question] = []

        guard let url = NSURL(string: "https://hiwawa.tech/questions.json") else { return }
        let request = NSURLRequest(url: url as URL)
        let data = try! NSURLConnection.sendSynchronousRequest(request as URLRequest, returning: nil)
        let json = JSON(data)
        
        //Массив игр с вопросами
        let gamesJSON = json["games"].arrayValue
        
        //Количество игр
        let gamesCount = gamesJSON.count
        print("Games Count: \(gamesCount)")
        
        //Массив одной игры с вопросами
        let gameQuestionList = json["games"][gameNumber]["questions"].arrayValue
        
        let questionsCount = gameQuestionList.count
        print("Questions Count: \(questionsCount)")
        
        //Формирование массива вопросов для игровой сессии
        for index in 0...(questionsCount - 1) {
            
            //Вопрос
            let questionText = gameQuestionList[index]["question"]
            
            //Правильный ответ
            let correctAnswer = gameQuestionList[index]["correct"]
            
            //Вариант ответа 1
            let answerOne = gameQuestionList[index]["content"][0]
            
            //Вариант ответа 2
            let answerTwo = gameQuestionList[index]["content"][1]
            
            //Вариант ответа 3
            let answerThree = gameQuestionList[index]["content"][2]
            
            //Вариант ответа 4
            let answerFour = gameQuestionList[index]["content"][3]
            
            //Список вариантов ответа
            let answerList = Question.Answer.self

            //Объект вопроса
            let questionItem = Question(
                questionText: questionText.rawValue as! String,
                correctAnswer: correctAnswer.rawValue as! Int,
                answerList: answerList.init(
                    answerOne: answerOne.rawValue as! String,
                    answerTwo: answerTwo.rawValue as! String,
                    answerThree: answerThree.rawValue as! String,
                    answerFour: answerFour.rawValue as! String)
            )
            
            //Добавляем вопрос в массив
            questionsList.append(questionItem)
            
        }
    }
    
}
