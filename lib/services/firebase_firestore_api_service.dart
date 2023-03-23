List<Map<String, dynamic>> getQuestionsFromFirebse() {
  final List<Map<String, dynamic>> questions = [
    // {
    //   "id": 1,
    //   "pairs": [
    //     { "id": 0, "languageOne": "questionTWO 0", "languageTwo": " questionTWO 0" },
    //     { "id": 1, "languageOne": "questionTWO 1", "languageTwo": " questionTWO 1" },
    //     { "id": 2, "languageOne": "questionTWO 2", "languageTwo": " questionTWO 2" },
    //     { "id": 3, "languageOne": "questionTWO 3", "languageTwo": " questionTWO 3" },
    //     { "id": 4, "languageOne": "questionTWO 4", "languageTwo": " questionTWO 4" },
    //   ],
    //   "title": "Question 2" ,
    //   "difficulty": 5,
    //   "pairsVerified": <bool>[],
    //   "type": "tapmatchingpairs",
    //   "result": -1
    // },
    // {
    //   "id": 2,
    //   "sentences": {"languageOne": "Ana sa yaay", 'languageTwo':'Comment va ta mère'},
    //   "sentenceLanguage": "languageOne",
    //   "sentenceTranslationLanguage": "languageTwo",
    //   "title": "Question 2" ,
    //   "type": "translatethissentence",
    //   "result": -1
    // },
    // {
    //   "id": 3,
    //   "image": "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2F736x%2Fa7%2F06%2F0a%2Fa7060a99cc4d6dafef9ea7d54770f407.jpg&f=1&nofb=1&ipt=ad65d979e3a42c492f35136b012b852d5532f20c3bafcf55e3ac2a8e2b82e78a&ipo=images",
    //   "answer": "yaay",
    //   "answerTranslation": "mère",
    //   "title": "Question 4" ,
    //   "type": "hangingword",
    //   "result": -1
    // },
    // {
    //  "id": 4,
    //  "options": ["père", "mère", "frère"],
    //  "answer": { "mère":"yaay" },
    //  "type": "selecttranslation",
    //  "title": "Comment dis-tu",
    //  "result": -1
    // },
    // {
    //  "id": 5,
    //  "options": ["yaay", "baay", "kay"],
    //  "answer": { "yaay":"mère" },
    //  "type": "selecttranslation",
    //  "title": "Comment dis-tu",
    //  "result": -1
    // },
    // {
    //  "id": 6,
    //  "title": "Traduis cette phrase",
    //  "answer": { "Nanga def":"Comment vas tu" },
    //  "type": "writetranslation",
    //  "result": -1
    // },
    // {
    //  "id": 7,
    //  "question": "Muy bien de los lokos ...",
    //  "options": ["Lorem ipsum de la", "Lorem ipsum de la chalag", "Lorem ipsum de la chalag"],
    //  "answer": "Lorem ipsum de la chalag",
    //  "answerTranslation": "Lorem ipsum de la chalag",
    //  "text": "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500 ",
    //  "type": "readandrespond",
    //  "title": "Read and respond",
    //  "result": -1
    // },
    // {
    //   "id": 8,
    //   "answer": "Naka ligguey bi",
    //   "answerTranslated": "Comment vas tu",
    //   "wordsToSelectAnswer": ["ligguey"],
    //   "selectableWords": ["ligguey", "elelou", "majari", "lescal", "trap"],
    //   "title": "Complete the sentence" ,
    //   "type": "completethesentence",
    //   "result": -1
    // },
    //  {
    //   "id": 9,
    //   "answer": "Naka ligguey bi",
    //   "answerTranslated": "Comment vas tu",
    //   "image": "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2F736x%2Fa7%2F06%2F0a%2Fa7060a99cc4d6dafef9ea7d54770f407.jpg&f=1&nofb=1&ipt=ad65d979e3a42c492f35136b012b852d5532f20c3bafcf55e3ac2a8e2b82e78a&ipo=images",
    //   "wordsToSelectAnswer": ["ligguey"],
    //   "selectableWords": ["ligguey", "elelou", "majari", "lescal", "trap"],
    //   "title": "Complete the sentence" ,
    //   "type": "completethesentence",
    //   "result": -1
    // },
    // {
    //   "id": 10,
    //   "image": "",
    //   "answer": "Dinaa dem suba",
    //   "image": "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2F736x%2Fa7%2F06%2F0a%2Fa7060a99cc4d6dafef9ea7d54770f407.jpg&f=1&nofb=1&ipt=ad65d979e3a42c492f35136b012b852d5532f20c3bafcf55e3ac2a8e2b82e78a&ipo=images",
    //   "answerTranslated": "Je viens demain",
    //   "wordsToSelectAnswer": ["Dinaa"],
    //   "selectableWords": ["enga", "uma", "inaa"],
    //   "title": "Complete the word" ,
    //   "type": "completetheword",
    //   "result": -1
    // },
    {
      "id": 11,
      "image": "",
      "answer": "Dinaa dem suba",
      "answerTranslated": "Je viens demain",
      "wordsToSelectAnswer": ["Dinaa"],
      "selectableWords": ["enga", "uma", "inaa"],
      "title": "Complete the word" ,
      "type": "completetheword",
      "result": -1
    },
  ];

  return questions;
}

List<Map<String,dynamic>>  getQuizFromFirebase(){
  const String image = "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F61%2F00%2Fb6%2F6100b6e29f34cc3c1d69e966bf1bfd9c.png&f=1&nofb=1&ipt=62f03168ed6afac6143ec84e8a482180238020a42442ace6f627fd6bd9f0be71&ipo=images";
  List<Map<String,dynamic>> quiz = [
    {
      "id": 4,
      "name": "My quiz",
      "image": image,
      "level": 0,
      "numberOfQuestions": 10,
    },
    {
      "id": 5,
      "name": "My quiz",
      "image": image,
      "level": 1,
      "numberOfQuestions": 10,
    },
    {
      "id": 6,
      "name": "My quiz",
      "image": image,
      "level": 5,
      "numberOfQuestions": 10,
    },
    {
      "id": 7,
      "name": "My quiz",
      "image": image,
      "level": 4,
      "numberOfQuestions": 10,
    },
    {
      "id": 8,
      "name": "My quiz",
      "image": image,
      "level": 1,
      "numberOfQuestions": 10,
    },
    {
      "id": 9,
      "name": "My quiz",
      "image": image,
      "level": 1,
      "numberOfQuestions": 10,
    },
    {
      "id": 10,
      "name": "My quiz",
      "image": image,
      "level": 1,
      "numberOfQuestions": 10,
    },
    {
      "id": 11,
      "name": "My quiz",
      "image": image,
      "level": 1,
      "numberOfQuestions": 10,
    },
  ];

  return quiz;
}

Map<String, List<Map<String,String>>>  getLeadboardFromFirebase(){
  const String image = "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F61%2F00%2Fb6%2F6100b6e29f34cc3c1d69e966bf1bfd9c.png&f=1&nofb=1&ipt=62f03168ed6afac6143ec84e8a482180238020a42442ace6f627fd6bd9f0be71&ipo=images";
  Map<String, List<Map<String,String>>> leadboard = {
    "contentList":  [
      {
        "userRank": "4",
        "userImage": image,
        "userPseudo": "Marion Lebron",
        "userPoints": "4359",
      },
      {
        "userRank": "5",
        "userImage": image,
        "userPseudo": "Marion Lebron",
        "userPoints": "4359",
      },
      {
        "userRank": "6",
        "userImage": image,
        "userPseudo": "Marion Lebron",
        "userPoints": "4359",
      },
      {
        "userRank": "7",
        "userImage": image,
        "userPseudo": "Marion Lebron",
        "userPoints": "4359",
      },
      {
        "userRank": "8",
        "userImage": image,
        "userPseudo": "Marion Lebron",
        "userPoints": "4359",
      },
      {
        "userRank": "9",
        "userImage": image,
        "userPseudo": "Marion Lebron",
        "userPoints": "4359",
      },
      {
        "userRank": "10",
        "userImage": image,
        "userPseudo": "Marion Lebron",
        "userPoints": "4359",
      },
      {
        "userRank": "11",
        "userImage": image,
        "userPseudo": "Marion Lebron",
        "userPoints": "4359",
      },
    ],
    "minimalList": [
      {
        "userRank": "2",
        "userImage": image,
        "userPseudo": "Marion",
        "userPoints": "4359",
      },
      {
        "userRank": "1",
        "userImage": image,
        "userPseudo": "Keith",
        "userPoints": "4359",
      },
      {
        "userRank": "3",
        "userImage": image,
        "userPseudo": "RDCWorld",
        "userPoints": "4359",
      },
    ]
  };

  return leadboard;
}


Map<String,List<String>> getFeedbackFromFirebase(){
  return {"goodAnswer": ["SUPER", "NICE", "GOOD JOB", "WELL DONE"]};
}