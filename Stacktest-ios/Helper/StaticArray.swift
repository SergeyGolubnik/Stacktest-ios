//
//  StaticArray.swift
//  Stacktest-ios
//
//  Created by СОВА on 25.06.2022.
//

import Foundation


let arrayStaticGroup = [
    ModelCategory(id: "16", name: "dorozhnye-znaki-rossii", alias: "dorozhnye-znaki-rossii", image: "images/categories/russ_zna.png", parentId: "1", title: "Дорожные знаки России", version: "1", test: [], stackTest: [], modelCategory: [
        ModelCategory(id: "19", name: "preduprezhdayushchie-znaki", alias: "preduprezhdayushchie-znaki", image: "images/categories/pred_1.png", parentId: "16", title: "Предупреждающие знаки", version: "1", test: [], stackTest: [], modelCategory: []),
        ModelCategory(id: "22", name: "znaki-prioriteta", alias: "znaki-prioriteta", image: "", parentId: "16", title: "Знаки приоритета", version: "1", test: [], stackTest: [], modelCategory: []),
        ModelCategory(id: "25", name: "zapreshchayushchie-znaki", alias: "zapreshchayushchie-znaki", image: "", parentId: "16", title: "Запрещающие знаки", version: "1", test: [], stackTest: [], modelCategory: []),
        ModelCategory(id: "28", name: "predrisyvayushchie-znaki", alias: "predrisyvayushchie-znaki", image: "", parentId: "16", title: "Предписывающие знаки", version: "1", test: [], stackTest: [], modelCategory: []),
        ModelCategory(id: "32", name: "znaki-osobykh-predpisanij", alias: "znaki-osobykh-predpisanij", image: "", parentId: "16", title: "Знаки особых предписаний", version: "1", test: [], stackTest: [], modelCategory: []),
        ModelCategory(id: "34", name: "informatsionnye-znaki", alias: "informatsionnye-znaki", image: "", parentId: "16", title: "Информационные знаки", version: "1", test: [], stackTest: [], modelCategory: []),
        ModelCategory(id: "36", name: "znaki-servisa", alias: "znaki-servisa", image: "", parentId: "16", title: "Знаки сервиса", version: "1", test: [], stackTest: [], modelCategory: []),
        ModelCategory(id: "39", name: "znaki-dopolnitelnoj-informatsii", alias: "znaki-dopolnitelnoj-informatsii", image: "", parentId: "16", title: "Знаки дополнительной информации", version: "1", test: [], stackTest: [], modelCategory: []),
        ModelCategory(id: "46", name: "gorizontalnaya-razmetka", alias: "gorizontalnaya-razmetka", image: "", parentId: "16", title: "Горизонтальная разметка", version: "1", test: [], stackTest: [
            
        ], modelCategory: []),
        ModelCategory(id: "47", name: "vertikalnaya-razmetka", alias: "vertikalnaya-razmetka", image: "", parentId: "16", title: "Вертикальная разметка", version: "1", test: [], stackTest: [], modelCategory: [])
    ]),
    ModelCategory(id: "42", name: "pdd-testy-rossii-gibdd", alias: "pdd-testy-rossii-gibdd", image: "images/categories/russ_test.png", parentId: "1", title: "ПДД тесты России (ГИБДД)", version: "1", test: [], stackTest: [], modelCategory: [
        ModelCategory(id: "8", name: "testy-pdd-kategoriya-a-b-m-rf-gibdd", alias: "testy-pdd-kategoriya-a-b-m-rf-gibdd", image: "images/categories/AB.png", parentId: "42", title: "Тесты ПДД категория \'A\'\'B\'\'M\'", version: "1", test: [
            ModelTest(
                id: "1",
                name: "test1-rf-pdd",
                title: "1",
                category: "8",
                question: [
                    "В каком случае водитель совершит вынужденную остановку?",
                    "Разрешен ли Вам съезд на дорогу с грунтовым покрытием?",
                    "Можно ли Вам остановиться в указанном месте для посадки пассажира?",
                    "Какие из указанных знаков запрещают движение водителям мопедов?",
                    "Вы намерены повернуть налево. Где следует остановиться, чтобы уступить дорогу легковому автомобилю?",
                    "Что означает мигание зеленого сигнала светофора?",
                    "Водитель обязан подавать сигналы световыми указателями поворота (рукой):",
                    "Как Вам следует поступить при повороте направо?",
                    "По какой траектории Вам разрешено выполнить разворот?",
                    "С какой скоростью Вы можете продолжить движение вне населенного пункта по левой полосе на легковом автомобиле?",
                    "Можно ли водителю легкового автомобиля выполнить опережение грузовых автомобилей вне населенного пункта по такой траектории?",
                    "В каком случае водителю разрешается поставить автомобиль на стоянку в указанном месте?",
                    "При повороте направо Вы должны уступить дорогу:",
                    "Вы намерены проехать перекресток в прямом направлении. Кому Вы должны уступить дорогу?",
                    "Кому Вы обязаны уступить дорогу при повороте налево?",
                    "С какой максимальной скоростью можно продолжить движение за знаком?",
                    "Для перевозки людей на мотоцикле водитель должен иметь водительское удостоверение на право управления транспортными средствами:",
                    "При какой неисправности разрешается эксплуатация транспортного средства?",
                    "В случае, когда правые колеса автомобиля наезжают на неукрепленную влажную обочину, рекомендуется:",
                    "Что понимается под временем реакции водителя?"
                ],
                answer1: [
                    "Остановившись непосредственно перед пешеходным переходом, чтобы уступить дорогу пешеходу.",
                    "Разрешен.",
                    "Можно.",
                    "Только А",
                    "Перед знаком",
                    "Предупреждает о неисправности светофора.",
                    "Перед началом движения или перестроением.",
                    "Перестроиться на правую полосу, затем осуществить поворот.",
                    "Только по А.",
                    "Не более 50 км/ч.",
                    "Можно.",
                    "Только если расстояние до сплошной линии разметки не менее 3 м.",
                    "Только велосипедисту.",
                    "Обоим трамваям.",
                    "Только автобусу.",
                    "60 км/ч.",
                    "Категории «A» или подкатегории «A1».",
                    "Не работают пробки топливных баков.",
                    "Затормозить и полностью остановиться.",
                    "Время с момента обнаружения водителем опасности до полной остановки транспортного средства."
                ],
                answer2: [
                    "Остановившись на проезжей части из-за технической неисправности транспортного средства.",
                    "Разрешен только при технической неисправности транспортного средства.",
                    "Можно, если Вы управляете такси.",
                    "Только Б",
                    "Перед перекрестком у линии разметки.",
                    "Разрешает движение и информирует о том, что вскоре будет включен запрещающий сигнал.",
                    "Перед поворотом или разворотом.",
                    "Продолжить движение по второй полосе до перекрестка, затем повернуть.",
                    "Только по Б.",
                    "Не менее 50 км/ч и не более 70 км/ч.",
                    "Можно, если скорость грузовых автомобилей менее 30 км/ч.",
                    "Только если расстояние до края пересекаемой проезжей части не менее 5 м.",
                    "Только пешеходам.",
                    "Только трамваю А.",
                    "Только легковому автомобилю.",
                    "50 км/ч.",
                    "Любой категории или подкатегории в течение двух и более лет.",
                    "Не работает механизм регулировки положения сиденья водителя.",
                    "Затормозить и плавно направить автомобиль на проезжую часть.",
                    "Время с момента обнаружения водителем опасности до начала принятия мер по ее избежанию."
                ],
                answer3: [
                    "В обоих перечисленных случаях.",
                    "Запрещен.",
                    "Нельзя.",
                    "В и Г",
                    "На перекрестке перед прерывистой линией разметки.",
                    "Запрещает дальнейшее движение.",
                    "Перед остановкой.",
                    "Возможны оба варианта действий.",
                    "По любой из указанных.",
                    "Не менее 50 км/ч и не более 90 км/ч.",
                    "Нельзя.",
                    "При соблюдении обоих перечисленных условий.",
                    "Пешеходам и велосипедисту.",
                    "Только трамваю Б.",
                    "Никому.",
                    "30 км/ч.",
                    "Только категории «A» или подкатегории «A1» в течение двух и более лет.",
                    "Не работают устройства обогрева и обдува стекол.",
                    "Не прибегая к торможению, плавно направить автомобиль на проезжую часть.",
                    "Время, необходимое для переноса ноги с педали управления подачей топлива на педаль тормоза."
                ],
                answer4: [
                    "",
                    "",
                    "",
                    "Все",
                    "В любом месте по усмотрению водителя.",
                    "",
                    "Во всех перечисленных случаях.",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "Никому.",
                    "Никому.",
                    "",
                    "20 км/ч.",
                    "",
                    "Не работает стеклоподъемник.",
                    "",
                    ""],
                correct: [
                    "2", "1", "1", "4", "2", "2", "4", "3", "1", "3", "1", "3", "3", "1", "3", "4", "3", "4", "3", "2"
                ],
                img: [
                    "",
                    "images/test_russia/b1-2/3f9a639.jpg",
                    "images/test_russia/b1-2/8fd84f3b81.jpg",
                    "images/test_russia/b1-2/SZKoDrt.jpg",
                    "images/test_russia/b1-2/KrqeLVl.jpg",
                    "",
                    "",
                    "images/test_russia/b1-2/7jTeBxf.jpg",
                    "images/test_russia/b1-2/GiPiUHh.jpg",
                    "images/test_russia/b1-2/dREbJrq.jpg",
                    "images/test_russia/b1-2/tGbyt45.jpg",
                    "images/test_russia/b1-2/YFRXvgQ.jpg",
                    "images/test_russia/b1-2/40ae.jpg",
                    "images/test_russia/b1-2/56b7d60779d5a12.jpg",
                    "images/test_russia/b1-2/SvP2rYy.jpg",
                    "images/test_russia/b1-2/i7fIAsg.jpg",
                    "",
                    "",
                    "",
                    ""
                ])
        ], stackTest: [], modelCategory: []),
        ModelCategory(id: "43", name: "testy-pdd-kategoriya-c-d", alias: "testy-pdd-kategoriya-c-d", image: "images/categories/CD.png", parentId: "42", title: "Тесты ПДД категория \'C\'\'D\'", version: "1", test: [], stackTest: [], modelCategory: [])])
]
let obuchenieArrayStatik = [
    ModelCategory(id: "54", name: "obuchenie", alias: "obuchenie", image: "images/categories/stack_vosk.png", parentId: "1", title: "Учебные карточки", version: "1", test: [], stackTest: [], modelCategory: [])
]
let questionStatic = ModelQuestion(title: "9", question: "Водитель движущегося автомобиля перед перестроением включил указатель поворота. Должен ли он уступить дорогу транспортным средствам, на полосу которых он собрался перестраиваться?", answer1: " Да, можно.", answer2: "Да, можно, но в определенных пропорциях.", answer3: "Нет, нельзя.", answer4: "", correct: "3", img: "images/test_ukr_b/b15-16/1.jpg")

